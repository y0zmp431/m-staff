# encoding: utf-8
# language: ru
Функционал: Действия с баннерами на статьи
	Баннер - красивое отображение ссылки на какую-либо страницу сайта. В зависимоси от типа баннер может быть показвн в разных местах и иметь разные стили.

	Сценарий: Если не указан заголовок баннера то он бересться из статьи на которую ссылается баннер.

	

  Сценарий: Писатель может создать баннер по ссылке из списка баннеров
		Допустим я писатель
			И я перехожу на страницу Список баннеров
		  И я кликаю ссылку "Новый баннер"
		Если я оказался на странице Новый баннер
			И я ввожу следующие значения: 
				| banner[target_url] | /articles          |
				| banner[title]      | Первый     |
				| banner[content]    | some images and text |
			И убираю крестик в поле "banner[disabled]"
			И кликаю кнопку "Сохранить"
		То я должен оказаться на странице Баннер "Первый"
		  И увидеть сообщение "Баннер сохранен и включен"


  Сценарий: При создании баннера ссылка которого не открывается, появиться уведомление.
		Допустим я писатель
			И я перехожу на страницу Список баннеров
		  И я кликаю ссылку "Новый баннер"
		Если я оказался на странице Новый баннер
			И я ввожу следующие значения: 
				| banner[target_url] | /article/test          |
				| banner[title]      | Первый |
				| banner[content]    | some images and text |
			И убираю крестик в поле "banner[disabled]"
			И кликаю кнопку "Сохранить"
		То я должен оказаться на странице Баннер "Первый"
		  И увидеть сообщение "Баннер сохранен и включен. (Баннер указывает на страницу которая не открывается)"
			

  Сценарий: При создании баннера без целевой ссылки, появиться уведомление.
		Допустим я писатель
			И я перехожу на страницу Список баннеров
		  И я кликаю ссылку "Новый баннер"
		Если я оказался на странице Новый баннер
			И я ввожу следующие значения: 
				| banner[title]      | Первый |
				| banner[content]    | some images and text |
			И убираю крестик в поле "banner[disabled]"
			И кликаю кнопку "Сохранить"
		То я должен оказаться на странице Баннер "Первый"
		  И увидеть сообщение "Баннер сохранен и включен. (Баннер без ссылки и никуда не приведет)"


  Сценарий: Писатель может отключить баннер по ссылке из списка баннеров
		Допустим я писатель
			И существует баннер "1"
			И я перехожу на страницу Список баннеров
		Если я вижу ссылку на страницу Баннер "1"
		  И я кликаю ссылку "Отключить"
		То я должен оказаться на странице Список баннеров
			И я должен увидеть сообщение "Баннер отключен"
			И баннер "1" должен иметь следующие аттрибуты:
				| disabled | true |

  Сценарий: Писатель может включить отключенный баннер по ссылке из списка баннеров
		Допустим я писатель
			И существует отключенный баннер "1"
			И я перехожу на страницу Список баннеров
		Если я вижу ссылку на страницу Баннер "1"
		  И я кликаю ссылку "Включить"
		То я должен оказаться на странице Список баннеров
			И я должен увидеть сообщение "Баннер включен"
			И баннер "1" должен иметь следующие аттрибуты:
				| disabled | false |



  Сценарий: Писатель может отредактировать баннер по ссылке из списка баннеров
		Допустим я писатель
			И существует баннер "1" с
				| target_url | /article/first |
				| content    | first article |
				| banner_type       | test_banner |
			И я перехожу на страницу Список баннеров
		Если я вижу ссылку на страницу Баннер "1"
		  И я кликаю ссылку "Редактировать"
			И я оказался на странице Редактирование баннера "1"
			И я ввожу следующие значения: 
				| banner[target_url] | /article/first_and_beaty |
				| banner[title]      | first_and_beaty |
				| banner[content]    | beaterfull first article |
				| banner[banner_type]       | small |
			И кликаю кнопку "Сохранить"
		То я должен оказаться на странице Баннер "first_and_beaty"
			И я должен увидеть сообщение "Баннер сохранен"
			И баннер "first_and_beaty" должен иметь следующие аттрибуты:
				| target_url | /article/first_and_beaty |
				| content    | beaterfull first article |
				| banner_type       | small  |



  Сценарий: При сохранении(редактировании) баннера ссылка которого не открывается, появиться уведомление.
		Допустим я писатель
			И существует баннер "1" с
				| target_url | /article/first |
				| content    | first article |
				| banner_type       | test_banner |
			И я перехожу на страницу Список баннеров
		Если я вижу ссылку на страницу Баннер "1"
		  И я кликаю ссылку "Редактировать"
			И я оказался на странице Редактирование баннера "1"
			И я ввожу следующие значения: 
				| banner[target_url] | /article/first_and_beaty |
				| banner[title]      | first_and_beaty |
				| banner[content]    | beaterfull first article |
				| banner[banner_type]       | small |
			И кликаю кнопку "Сохранить"
		То я должен оказаться на странице Баннер "first_and_beaty"
		  И увидеть сообщение "Баннер сохранен и включен. (Баннер указывает на страницу которая не открывается)"
			

  Сценарий: При сохранении(редактировании) баннера без целевой ссылки, появиться уведомление.
		Допустим я писатель
			И существует баннер "1" с
				| target_url | /article/first |
				| content    | first article |
				| banner_type       | test_banner |
			И я перехожу на страницу Список баннеров
		Если я вижу ссылку на страницу Баннер "1"
		  И я кликаю ссылку "Редактировать"
			И я оказался на странице Редактирование баннера "1"
			И я ввожу следующие значения: 
				| banner[target_url] |  |
				| banner[content]    | beaterfull first article |
				| banner[title]      | beaterfull first|
				| banner[banner_type]       | small |
			И кликаю кнопку "Сохранить"
		То я должен оказаться на странице Баннер "beaterfull first"
		  И увидеть сообщение "Баннер сохранен и включен. (Баннер без ссылки и никуда не приведет)"


  Сценарий: Простой пользователь не может зайти на страницу с баннерами
		Допустим я простой пользователь
		Если я перехожу на страницу Список баннеров:
		То я должен увидеть сообщение "Нет привелегий для выполнения данного действия"
		И не должно быть текста "Список баннеров"
		И не должно быть ссылки на страницу "Новый баннер"
		





  Сценарий: Нельзя создать баннер без контента 
		Допустим я писатель
		Если я на странице "Новый баннер"
			И я ввожу следующие значения: 
				| banner[target_url] | /article/first_and_beaty |
				| banner[title]      | first_and_beaty |
				| banner[banner_type]       | small |
			И кликаю кнопку "Сохранить"
		То я должен увидеть сообщение "Баннер не сохранен"
		  И увидеть сообщение "Контент не может быть пустым"

