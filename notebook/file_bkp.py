# -*- coding: utf-8 -*-
"""
Editor Spyder

Este é um arquivo de script temporário.
"""

import os
from zipfile import ZipFile
from shutil import make_archive
import configparser
import datetime


dt = datetime.datetime.now()

current_dir = os.path.abspath(os.path.join(os.getcwd()))
print(current_dir)
cfg = configparser.ConfigParser()
cfg.read(current_dir + '\\' + 'config_bkp.ini')


file1 = cfg.get('section1','file1')
file2 = cfg.get('section1','file2')
file3 = cfg.get('section1','file3')

path_origin= cfg.get('section1','path_origin')
path_destiny= cfg.get('section1','path_destiny')

#print(file1)
#print(path_origin)
#print(path_destiny)
#print(path_origin + '\\' + file1 + '.FDB')

x = input("Caso deseje fazer backup pressione S para continuar:")


if x == 'S' or x == 's':
    print('Iniciando backup...')
    make_archive(path_destiny + '\\' + file1 + '_' + str(dt.day), 'zip', path_origin, file1 + '.FDB')
    print('Backup: ' + file1 + '_' + str(dt.day) + '.zip' + ' com sucesso!')
    make_archive(path_destiny + '\\' + file2, 'zip', path_origin, file2 + '.FDB')
    print('Backup: ' + file2 + '.zip' + ' com sucesso!')
    make_archive(path_destiny + '\\' + file3, 'zip', path_origin, file3 + '.FDB')
    print('Backup: ' + file3 + '.zip' + ' com sucesso!')

    input("Pressione qualquer tecla para finalizar")

    print('Backup feito')

else:
    input("Backup não realizado. Pressione qualquer tecla para sair")