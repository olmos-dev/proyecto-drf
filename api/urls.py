from django.urls import path, include
from api.views import ListarPeliculasApiView, DetallePeliculaApiView


urlpatterns = [
    path('listar-peliculas', ListarPeliculasApiView.as_view(), name="listar.peliculas"),
    path('detalle-pelicula/<int:pk>', DetallePeliculaApiView.as_view(), name="detalle.pelicula"),
]
