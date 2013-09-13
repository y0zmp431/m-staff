# encoding: utf-8
# language: ru
Функционал: Собственно собаки


  Сценарий: Писатель может создать запись собаки, указывая кличку, имя по родословке, пол, метку о продаже, метку о предложении вязки, дату рождения, титулы и ссылку на родословную.
		Допустим я писатель
			И я перехожу на страницу Список собак
		  И я кликаю ссылку "Добавить"
		Если я оказался на странице Новый песик
			И я ввожу следующие значения: 
				| dog[name]     | Номка       |
				| dog[fullname] | Amelinka NomiStar Aleksa's House |
				| dog[desc]     | some images and text |
				| dog[pedigree] | www.chiness.be |
      И я выбираю дату "2010-07-12" в поле "dog_date_of_birth"
			И убираю крестик в поле "dog[disabled]"
			И убираю крестик в поле "dog[male]"
			И убираю крестик в поле "dog[for_sale]"
			И убираю крестик в поле "dog[for_love]"
			И кликаю кнопку "Сохранить"
		То я должен оказаться на странице собаки "Номка"
		  И увидеть сообщение "Номка на сайте"
      И должен увидеть текст "Amelinka NomiStar Aleksa's House"

  Сценарий: Нельзя создать двух собак с одинаковыми именами.
		Допустим я писатель
      И существует собака "Номка"
			И я перехожу на страницу Список собак
		  И я кликаю ссылку "Добавить"
		Если я оказался на странице Новый песик
			И я ввожу следующие значения: 
				| dog[name]     | Номка       |
				| dog[fullname] | Amelinka NomiStar Aleksa's House |
				| dog[desc]     | some images and text |
				| dog[pedigree] | www.chiness.be |
      И я выбираю дату "2010-07-12" в поле "dog_date_of_birth"
			И кликаю кнопку "Сохранить"
		То я должен увидеть сообщение "Имя уже существует"

  Сценарий: Нельзя создать собаку без имени.
		Допустим я писатель
			И я перехожу на страницу Список собак
		  И я кликаю ссылку "Добавить"
		Если я оказался на странице Новый песик
			И я ввожу следующие значения: 
				| dog[fullname] | Amelinka NomiStar Aleksa's House |
				| dog[desc]     | some images and text |
				| dog[pedigree] | www.chiness.be |
      И я выбираю дату "2010-07-12" в поле "dog_date_of_birth"
			И кликаю кнопку "Сохранить"
		То я должен увидеть сообщение "Имя не может быть пустым"

  Сценарий: Страница каждой собаки досупна по красивому url, если при создании url не указан, то url — имя собаки в транслите
		Допустим я писатель
			И я перехожу на страницу Список собак
		  И я кликаю ссылку "Добавить"
		Если я оказался на странице Новый песик
			И я ввожу следующие значения: 
				| dog[name]     | Номка       |
				| dog[fullname] | Amelinka NomiStar Aleksa's House |
				| dog[desc]     | some images and text |
				| dog[pedigree] | www.chiness.be |
      И я выбираю дату "2010-07-12" в поле "dog_date_of_birth"
			И кликаю кнопку "Сохранить"
		То я должен оказаться на странице с URL "/dogs/nomka"
      И должен увидеть текст "Amelinka NomiStar Aleksa's House"

  Сценарий: Просматривая песика можно добавлять фото в его галерею
		Допустим я писатель
      И существует собака "Номка"
			И я перехожу на страницу собаки "Номка"
    Если я кликаю ссылку "Добавить фото"
			И я выбираю файл "test/factories/nomka.JPG" в поле "photo[image]"
			И кликаю кнопку "Сохранить"
    То у собаки "Номка" должна быть фотография

  #@javascript
  Сценарий: Одной фотографии может соответствовать несколько песиков
		Допустим я писатель
      И существует собака "Номка"
      И существует собака "Тоши"
			И я перехожу на страницу собаки "Номка"
    Если я кликаю ссылку "Добавить фото"
			И я выбираю файл "test/factories/nomka.JPG" в поле "photo[image]"
      И я ввожу "Тош" в поле "dog_name" 
      И покажи текст
      И выбираю "Тоши" в выпавшем списке
			И кликаю кнопку "Сохранить"
    То у собаки "Номка" должна быть фотография
      И у собаки "Тоши" должна быть фотография

  Сценарий: Абы-кто не может добавлять собак
    Допустим я перехожу на страницу Список собак
    Если я кликаю ссылку "Добавить"
		То  я должен увидеть сообщение "Нет привелегий для выполнения данного действия"
    
  Сценарий: Отключенную собаку не видно в списке
  
  Сценарий: Под заголовком — именем собаки пишется ее возраст и титул

  Сценарий: В каждой статье может быть пометка о собаках, про которых идет речь. А на странице собаки можно увидеть список материалов, где отмечен этот песик.
