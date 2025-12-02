from django.urls import path, include
from api.views import (
  ListarContenidoApiView, DetalleContenidoApiView, 
  ListarPlataformaApiView, DetallePlataformaApiView, 
  ResenaList, ResenaDetail
)

urlpatterns = [
    path('listar-contenido', ListarContenidoApiView.as_view(), name="listar.contenido"),
    path('detalle-contenido/<int:pk>', DetalleContenidoApiView.as_view(), name="detalle.contenido"),
    path('listar-plataforma', ListarPlataformaApiView.as_view(), name="listar.plataforma"),
    path('detalle-plataforma/<int:pk>', DetallePlataformaApiView.as_view(), name="detalle.plataforma"),
    path('listar-resena', ResenaList.as_view(), name="listar.resena"),
    path('detalle-resena/<int:pk>', ResenaDetail.as_view(), name="detalle.resena")

    
]
