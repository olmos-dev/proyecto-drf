from django.urls import path, include
from api.views import (
  ListarContenidoApiView, DetalleContenidoApiView, 
  ListarPlataformaApiView, DetallePlataformaApiView, 
  ResenaList, ResenaDetail, ResenaCreate, UsuarioResena, ListarContenido
)

urlpatterns = [
    path('listar-contenido', ListarContenidoApiView.as_view(), name="listar.contenido"),
    path('listar2', ListarContenido.as_view(), name="listar.contenido.filtrar"),
    path('detalle-contenido/<int:pk>', DetalleContenidoApiView.as_view(), name="detalle.contenido"),
    path('listar-plataforma', ListarPlataformaApiView.as_view(), name="listar.plataforma"),
    path('detalle-plataforma/<int:pk>', DetallePlataformaApiView.as_view(), name="detalle.plataforma"),
    
    #path('listar-resena', ResenaList.as_view(), name="listar.resena"),
    #path('detalle-resena/<int:pk>', ResenaDetail.as_view(), name="detalle.resena")

    #path('listar-resena', ResenaList.as_view(), name="listar.resena"),
    path('listar-resena/<int:pk>/resena-crear', ResenaCreate.as_view(), name="crear.resena"),
    path('listar-resena/<int:pk>/resena', ResenaList.as_view(), name="listar.resena"),
    path('detalle-resena/<int:pk>', ResenaDetail.as_view(), name="detalle.resena"),

    #path('resenas/<str:username>', UsuarioResena.as_view(), name="detalle.resena.usuario")
    path('resenas/', UsuarioResena.as_view(), name="detalle.resena.usuario")

    
]
