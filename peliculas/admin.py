from django.contrib import admin
from .models import Contenido, Plataforma, Resena

class ResenaAdmin(admin.ModelAdmin):
  list_display = ("contenido_titulo", "puntuacion")

  def contenido_titulo(self, obj):
    return obj.contenido.titulo
  
  

# Register your models here.
admin.site.register(Contenido)
admin.site.register(Plataforma)
admin.site.register(Resena, ResenaAdmin)

