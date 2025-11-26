from django.shortcuts import render
from rest_framework.response import Response
from rest_framework.decorators import api_view
from peliculas.models import Pelicula
from api.serializers import PeliculaSerializer
from rest_framework import status
from rest_framework.views import APIView


class ListarPeliculasApiView(APIView):
    def get(self, request):
        peliculas = Pelicula.objects.all()
        serializador = PeliculaSerializer(peliculas, many=True)
        return Response(serializador.data, status=status.HTTP_200_OK)
    
    def post(self, request):
        serializador = PeliculaSerializer(data = request.data)
        if serializador.is_valid():
            serializador.save()
            return Response(serializador.data, status=status.HTTP_200_OK)
        return Response(serializador.errors, status=status.HTTP_422_UNPROCESSABLE_ENTITY)
    
class DetallePeliculaApiView(APIView):
    def get(self, request, pk):
        try:
            pelicula = Pelicula.objects.get(pk=pk)
        except Pelicula.DoesNotExist:
            return Response({"mensaje": "Pelicula no encontrada"}, status=status.HTTP_404_NOT_FOUND)

        serializador = PeliculaSerializer(pelicula)
        return Response(serializador.data, status=status.HTTP_200_OK)
    
    def put(self, request, pk):
        try:
            pelicula = Pelicula.objects.get(pk=pk)
        except Pelicula.DoesNotExist:
            return Response({"mensaje": "Pelicula no encontrada"}, status=status.HTTP_404_NOT_FOUND)
        
        serializador = PeliculaSerializer(pelicula, data=request.data)
        if serializador.is_valid():
            serializador.save()
            return Response(serializador.data, status=status.HTTP_200_OK)
        return Response(serializador.errors, status=status.HTTP_400_BAD_REQUEST)
    
    def delete(self, request, pk):
        try:
            pelicula = Pelicula.objects.get(pk=pk)
        except Pelicula.DoesNotExist:
            return Response({"mensaje": "Pelicula no encontrada"}, status=status.HTTP_404_NOT_FOUND)
        pelicula.delete()
        return Response({"mensaje": "Pelicula eliminada correctamente"}, status=status.HTTP_204_OK)

            

   
   

