from rest_framework import serializers
from peliculas.models import Contenido, Plataforma

class ContenidoSerializer(serializers.ModelSerializer):
  class Meta:
    model = Contenido
    fields = ['id','plataforma','titulo', 'descripcion', 'activo', 'created_at']

  
class PlataformaSerializer(serializers.ModelSerializer):
  class Meta:
    model = Plataforma
    fields = ["id","nombre",'acerca','sitio_web']
