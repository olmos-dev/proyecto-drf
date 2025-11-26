from django.urls import path, include
from api.views import ListarContenidoApiView, DetalleContenidoApiView, ListarPlataformaApiView, DetallePlataformaApiView


urlpatterns = [
    path('listar-contenido', ListarContenidoApiView.as_view(), name="listar.contenido"),
    path('detalle-contenido/<int:pk>', DetalleContenidoApiView.as_view(), name="detalle.contenido"),
    path('listar-plataforma', ListarPlataformaApiView.as_view(), name="listar.plataforma"),
    path('detalle-plataforma/<int:pk>', DetallePlataformaApiView.as_view(), name="detalle.plataforma"),
]
