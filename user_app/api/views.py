from rest_framework.decorators import api_view
from user_app.api.serializers import RegistrationSerializer
from rest_framework.response import Response 
from rest_framework.authtoken.models import Token
from rest_framework import status

from rest_framework_simplejwt.tokens import RefreshToken
from rest_framework_simplejwt.exceptions import AuthenticationFailed


@api_view(['POST'])
def logout_view(request):
  if request.method == 'POST':
    request.user.auth_token.delete()
    return Response(status=status.HTTP_200_OK)

@api_view(['POST'])
def registration_view(request):
  if request.method == 'POST':
    serializer = RegistrationSerializer(data=request.data)
    data = {}

    if serializer.is_valid():
      cuenta = serializer.save()
      data['response'] = "Registro exitoso"
      data['username'] = cuenta.username
      data['email'] = cuenta.email
      
      #token, created = Token.objects.get_or_create(user=cuenta)
      #data["token"] = token.key

      refresh = RefreshToken.for_user(cuenta) #se le pasa el user

      data["token"] = {
          'refresh': str(refresh),
          'access': str(refresh.access_token),
      }

    else:
      data = serializer.errors

    return Response(data)