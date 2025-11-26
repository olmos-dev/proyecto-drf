from django.urls import path, include
from api.views import listar_peliculas, ver_pelicula, crear_pelicula, editar_pelicula,eliminar_pelicula

urlpatterns = [
    path('listar-peliculas', listar_peliculas, name="index.peliculas"),
    path('crear-pelicula/', crear_pelicula, name="crear.pelicula"),
    path('ver-pelicula/<int:pk>', ver_pelicula, name="ver.pelicula"),
    path('editar-pelicula/<int:pk>', editar_pelicula, name="editar.pelicula"),
    path('eliminar-pelicula/<int:pk>', eliminar_pelicula, name="eliminar.pelicula")
]
