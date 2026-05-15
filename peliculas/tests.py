from django.urls import reverse
from rest_framework import status
from rest_framework.test import APITestCase
from django.contrib.auth.models import User
from rest_framework.authtoken.models import Token


class TestRegistro(APITestCase):
  
  def test_registrar(self):
    data = {
      "username":"testcase",
      "email":"testcase@mail.com",
      "password":"Hondacr123",
      "password2":"Hondacr123"
    }
    response = self.client.post(reverse("register"), data)
    self.assertEqual(response.status_code, status.HTTP_201_CREATED)

class TestAutenticacion(APITestCase):

  def setUp(self):
    self.user = User.objects.create_user(
      username="alberto",
      password="Hondacr123"
    )

  def test_login(self):
    data = {
      "username":"alberto",
      "password":"Hondacr123"
    }
    response = self.client.post(reverse('login'), data)
    self.assertEqual(response.status_code, status.HTTP_200_OK)

  def test_logout(self):
    self.token = Token.objects.get(user__username="alberto")
    self.client.credentials(HTTP_AUTHORIZATION='Token ' + self.token.key)
    response = self.client.post(reverse('logout'))
    self.assertEqual(response.status_code, status.HTTP_200_OK)


    