from django.shortcuts import render
from rest_framework.response import Response
from rest_framework.decorators import api_view
from peliculas.models import Contenido, Plataforma, Resena
from api.serializers import (
    ContenidoSerializer, 
    PlataformaSerializer, 
    ResenaSerializer
)

from api.permissions import AdminOrReadOnly, ReviewUserOrReadOnly
from rest_framework import status
from rest_framework.views import APIView
from rest_framework import mixins
from rest_framework import generics
from rest_framework.exceptions import ValidationError
from rest_framework.permissions import IsAuthenticated,IsAuthenticatedOrReadOnly

class ResenaCreate(generics.CreateAPIView):
    serializer_class = ResenaSerializer

    def get_queryset(self):
        return Resena.objects.all()
    
    def perform_create(self, serializer):
        pk = self.kwargs.get("pk")
        contenido = Contenido.objects.get(pk=pk)

        usuario = self.request.user
        queryset = Resena.objects.filter(
            contenido_id = contenido,
            usuario_id = usuario.id
        )

        if queryset.exists():
            raise ValidationError("Ya has escrito una reseña")
        
        #calculo de la media
        if contenido.numero_calif == 0:
            contenido.avg_calif = serializer.validated_data["puntuacion"]
        else:
            contenido.avg_calif = (contenido.avg_calif + serializer.validated_data["puntuacion"]) /2
            
        contenido.numero_calif = contenido.numero_calif + 1
        contenido.save()
            
        serializer.save(contenido=contenido, usuario_id = usuario.id)

class ResenaList(generics.ListAPIView):
    permission_classes = [IsAuthenticated]
    #queryset = Resena.objects.all()
    serializer_class = ResenaSerializer

    def get_queryset(self):
        pk = self.kwargs['pk']
        return Resena.objects.filter(contenido_id = pk)

class ResenaDetail(generics.RetrieveUpdateDestroyAPIView):
    queryset = Resena.objects.all()
    serializer_class = ResenaSerializer
    permission_classes = [ReviewUserOrReadOnly]


"""
class ResenaList(mixins.ListModelMixin, mixins.CreateModelMixin, generics.GenericAPIView):
    queryset = Resena.objects.all()
    serializer_class = ResenaSerializer

    def get(self, request, *args, **kwargs):
        return self.list(request, *args, **kwargs)

    def post(self, request, *args, **kwargs):
        return self.create(request, *args, **kwargs)
    
class ResenaDetail(mixins.RetrieveModelMixin,mixins.UpdateModelMixin,mixins.DestroyModelMixin,generics.GenericAPIView):
    queryset = Resena.objects.all()
    serializer_class = ResenaSerializer

    def get(self, request, *args, **kwargs):
        return self.retrieve(request, *args, **kwargs)
"""
    
class ListarContenidoApiView(APIView):
    def get(self, request):
        contenidos = Contenido.objects.all()
        serializador = ContenidoSerializer(contenidos, many=True)
        return Response(serializador.data, status=status.HTTP_200_OK)
    
    def post(self, request):
        serializador = ContenidoSerializer(data = request.data)
        if serializador.is_valid():
            serializador.save()
            return Response(serializador.data, status=status.HTTP_200_OK)
        return Response(serializador.errors, status=status.HTTP_422_UNPROCESSABLE_ENTITY)
    
class DetalleContenidoApiView(APIView):
    def get(self, request, pk):
        try:
            contenido = Contenido.objects.get(pk=pk)
        except Contenido.DoesNotExist:
            return Response({"mensaje": "Contenido no encontrada"}, status=status.HTTP_404_NOT_FOUND)

        serializador = ContenidoSerializer(contenido)
        return Response(serializador.data, status=status.HTTP_200_OK)
    
    def put(self, request, pk):
        try:
            contenido = Contenido.objects.get(pk=pk)
        except Contenido.DoesNotExist:
            return Response({"mensaje": "Contenido no encontrada"}, status=status.HTTP_404_NOT_FOUND)
        
        serializador = ContenidoSerializer(contenido, data=request.data)
        if serializador.is_valid():
            serializador.save()
            return Response(serializador.data, status=status.HTTP_200_OK)
        return Response(serializador.errors, status=status.HTTP_400_BAD_REQUEST)
    
    def delete(self, request, pk):
        try:
            contenido = Contenido.objects.get(pk=pk)
        except Contenido.DoesNotExist:
            return Response({"mensaje": "Contenido no encontrada"}, status=status.HTTP_404_NOT_FOUND)
        contenido.delete()
        return Response({"mensaje": "Contenido eliminada correctamente"}, status=status.HTTP_204_OK)
    



class ListarPlataformaApiView(APIView):
    def get(self, request):
        plataformas = Plataforma.objects.all()
        serializador = PlataformaSerializer(plataformas, many=True)
        return Response(serializador.data, status=status.HTTP_200_OK)
    
    def post(self, request):
        serializador = PlataformaSerializer(data = request.data)
        if serializador.is_valid():
            serializador.save()
            return Response(serializador.data, status=status.HTTP_200_OK)
        return Response(serializador.errors, status=status.HTTP_422_UNPROCESSABLE_ENTITY)
    

class DetallePlataformaApiView(APIView):
    def get(self, request, pk):
        try:
            plataforma = Plataforma.objects.get(pk=pk)
        except Plataforma.DoesNotExist:
            return Response({"mensaje": "Plataforma no encontrada"}, status=status.HTTP_404_NOT_FOUND)

        serializador = PlataformaSerializer(plataforma)
        return Response(serializador.data, status=status.HTTP_200_OK)
    
    def put(self, request, pk):
        try:
            plataforma = Plataforma.objects.get(pk=pk)
        except Plataforma.DoesNotExist:
            return Response({"mensaje": "Plataforma no encontrada"}, status=status.HTTP_404_NOT_FOUND)
        
        serializador = PlataformaSerializer(plataforma, data=request.data)
        if serializador.is_valid():
            serializador.save()
            return Response(serializador.data, status=status.HTTP_200_OK)
        return Response(serializador.errors, status=status.HTTP_400_BAD_REQUEST)
    
    def delete(self, request, pk):
        try:
            plataforma = Plataforma.objects.get(pk=pk)
        except Plataforma.DoesNotExist:
            return Response({"mensaje": "Plataforma no encontrada"}, status=status.HTTP_404_NOT_FOUND)
        plataforma.delete()
        return Response({"mensaje": "Plataforma eliminada correctamente"}, status=status.HTTP_204_OK)
    

            

   
   

