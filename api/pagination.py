from rest_framework.pagination import PageNumberPagination, LimitOffsetPagination

class ListarContenidoPagination(PageNumberPagination):
  page_size = 10
  page_size_query_param = 'size'
  max_page_size = 100
  last_page_strings = ['ultima']

class ListarContenidoLimitOffsetPagination(LimitOffsetPagination):
  default_limit = 5
  max_limit = 10