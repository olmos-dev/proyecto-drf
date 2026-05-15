from django.test import TestCase

# Create your tests here.
from django.urls import reverse
from rest_framework import status
from rest_framework.test import APITestCase
from django.contrib.auth.models import User
from rest_framework.authtoken.models import Token

from api.serializers import serializers
from peliculas import models

class PlataformaStreamTestCase(APITestCase):
  def setUp(self):
    self.user = User.objects.create_user(
      username="olmos",
      password="Hondacr123"
    )
    self.token = Token.objects.get(user__username=self.user)
    self.client.credentials(HTTP_AUTHORIZATION='Token ' + self.token.key)
    self.stream = models.Plataforma.objects.create(
      nombre = "Netflix",
      acerca = "Lorem ipsum",
      sitio_web = "https//neflix.com"
    )

  def test_plataforma_stream_crear(self):
    data = {
      "nombre":"netflix",
      "acerca":"Lorem ipsum",
      "sitio_web": "https//neflix.com"
    }
    response = self.client.post(reverse("listar.plataforma"), data)
    self.assertEqual(response.status_code, status.HTTP_403_FORBIDDEN)

  def test_listar_plataforma_stream(self):
    response = self.client.get(reverse("listar.plataforma"))
    self.assertEqual(response.status_code, status.HTTP_200_OK)

  def test_individual_plataforma_stream(self):
    response = self.client.get(reverse('detalle.plataforma', args=(self.stream.id,)))
    self.assertEqual(response.status_code, status.HTTP_200_OK)
