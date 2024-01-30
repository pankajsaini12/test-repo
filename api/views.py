from django.shortcuts import render
from django.http import HttpResponse
from .models import TestModel


def home(request):
    TestModel.objects.create(test_field="Field1 Created")
    return HttpResponse("Request success.")
