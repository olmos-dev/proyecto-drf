from django.urls import path, include
from api.views import listar_peliculas, ver_pelicula

urlpatterns = [
    path('listar-peliculas', listar_peliculas, name="index.peliculas"),
    path('ver-pelicula/<int:pk>', ver_pelicula, name="ver.pelicula")
]
