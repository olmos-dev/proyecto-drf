from rest_framework import serializers
from django.core.validators import MinValueValidator, MaxValueValidator
from peliculas.models import Contenido, Plataforma, Resena

class ResenaSerializer(serializers.ModelSerializer):
  puntuacion = serializers.IntegerField(
    validators=[MinValueValidator(1), MaxValueValidator(5)]
  )
  usuario = serializers.StringRelatedField(read_only = True) 
  class Meta:
    model = Resena
    
    fields = ['puntuacion','descripcion','activo','created_at','updated_at','usuario']

class ContenidoSerializer(serializers.ModelSerializer):
  resenas = ResenaSerializer(many= True, read_only = True ) 
  #resenas = serializers.StringRelatedField(many=True)
  class Meta:
    model = Contenido
    fields = ['id','plataforma','titulo', 'descripcion', 'activo', 'created_at','resenas','avg_calif','numero_calif']
    #fields = '__all__'

  
class PlataformaSerializer(serializers.ModelSerializer):
  #Nested relationships
  #contenidos = ContenidoSerializer(many=True, read_only=True)

  #StringRelatedField
  contenidos = serializers.StringRelatedField(many=True)

  class Meta:
    model = Plataforma
    fields = ["id","nombre",'acerca','sitio_web', 'contenidos']
    #fields = ["nombre",'contenidos']
