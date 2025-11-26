from django.shortcuts import render
from rest_framework.response import Response
from rest_framework.decorators import api_view
from peliculas.models import Pelicula
from api.serializers import PeliculaSerializer
from rest_framework import status

@api_view(['GET'])
def listar_peliculas(request):
  """INDEX"""
  if request.method == 'GET':
      peliculas = Pelicula.objects.all()
      serializador = PeliculaSerializer(peliculas, many=True)
      return Response(serializador.data, status=status.HTTP_200_OK)
  

@api_view(["POST"])
def crear_pelicula(request):
  """CREATE"""
  if request.method == "POST":
      serializador = PeliculaSerializer(data = request.data)
      if serializador.is_valid():
        serializador.save()
        return Response(serializador.data, status=status.HTTP_200_OK)
      return Response(serializador.errors, status=status.HTTP_422_UNPROCESSABLE_ENTITY)
        
@api_view(["GET","PUT"])
def editar_pelicula(request, pk):
  """UPDATE"""
  try:
      pelicula = Pelicula.objects.get(pk=pk)
  except Pelicula.DoesNotExist:
      return Response({"mensaje": "Pelicula no encontrada"}, status=status.HTTP_404_NOT_FOUND)

  if request.method == 'GET':
      serializador = PeliculaSerializer(pelicula)
      return Response(serializador.data)

  elif request.method == 'PUT':
      serializador = PeliculaSerializer(pelicula, data=request.data)
      if serializador.is_valid():
          serializador.save()
          return Response(serializador.data, status=status.HTTP_200_OK)
      return Response(serializador.errors, status=status.HTTP_400_BAD_REQUEST)

@api_view(["GET", "DELETE"])
def eliminar_pelicula(request, pk):
  """DELETE"""
  try:
      pelicula = Pelicula.objects.get(pk=pk)
  except Pelicula.DoesNotExist:
      return Response({"mensaje": "Pelicula no encontrada"}, status=status.HTTP_404_NOT_FOUND)

  if request.method == 'GET':
      serializador = PeliculaSerializer(pelicula)
      return Response(serializador.data)

  elif request.method == 'DELETE':
      pelicula.delete()
      return Response({"mensaje": "Pelicula eliminada correctamente"}, status=status.HTTP_204_OK)
        

@api_view(["GET"])
def ver_pelicula(request, pk):
  """SHOW"""
  try:
      pelicula = Pelicula.objects.get(pk=pk)
  except Pelicula.DoesNotExist:
      return Response({"mensaje": "Pelicula no encontrada"}, status=status.HTTP_404_NOT_FOUND)

  serializador = PeliculaSerializer(pelicula)
  return Response(serializador.data, status=status.HTTP_200_OK)
  