from django.shortcuts import render
from rest_framework.response import Response
from rest_framework.decorators import api_view
from peliculas.models import Pelicula
from api.serializers import PeliculaSerializer

@api_view()
def listar_peliculas(request):
  peliculas = Pelicula.objects.all()
  serializador = PeliculaSerializer(peliculas, many=True)
  return Response(serializador.data)

@api_view()
def ver_pelicula(request, pk):
  pelicula = Pelicula.objects.get(pk=pk)
  serializador = PeliculaSerializer(pelicula, many=False)
  return Response(serializador.data)