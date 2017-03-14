#Создать рельсы 

rails new nameBlog

#Запустить рельсы 

rails server
  
  #Сокращенная команда
  rails s

  #Запустить в разных средах
  rails server -e test
  rails server -e development
  rails server -e prodaction

  #Поменять порт
  rails s -p 4000
  
#Создать генерацию

rails generate controller home index

  #Коротко генерация
  rails g controller home index
