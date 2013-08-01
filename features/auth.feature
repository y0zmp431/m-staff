# encoding: utf-8
# language: ru
Функционал: Авторизация пользователей

Для использования сайта, пользователи должны иметь возможность регистрироваться на сайте, залогиниваться и разлогиниваться.

	Сценарий: Вход на страницу аунтентификации 
		Если я перехожу на страницу Авторизация
		То  я должен увидеть форму с полями: 
		  | title        | name                    | type     |
			| Логин/e-mail | user_session[login]     | text     |
			| Пароль       | user_session[password]  | password |
			#И я должен увидеть кнопку "Войти"
			И кнопкой "Войти"
			#	И должен увидеть ссылку на страницу "Регистрация"
			И должен увидеть ссылку на страницу "Восстановление пароля" 


	Сценарий: Зарегистрированный пользователь может войти на сайт указывая логин 
		Допустим я пользователь c логином "tester1" и паролем "tester111"
		  И я на странице Авторизация
		Если я ввожу в поле "user_session[login]" значение "tester1"
		  И ввожу в поле "user_session[password]" значение "tester111"
		  И кликаю кнопку "Войти"
		То пользователь "tester1" должен быть аунтентифицирован
			И должен увидеть текст "Вход выполнен"

	Сценарий: Зарегистрированный пользователь может войти на сайт указывая e-mail 
		#Допустим я пользователь c e-mail "test@test.com" и паролем "tester111"
		Допустим я пользователь c:
			| email    | tester1@test.com |
			| password | tester111     |
		  И я на странице Авторизация
		Если я ввожу в поле "user_session[login]" значение "tester1@test.com"
		  И ввожу в поле "user_session[password]" значение "tester111"
		  И кликаю кнопку "Войти"
		То пользователь с email "tester1@test.com" должен быть аунтентифицирован
			И должен увидеть текст "Вход выполнен"

	Сценарий: Зарегистрированный пользователь не может войти на сайт указывая неправильный пароль 
		#Допустим я пользователь c e-mail "test@test.com" и паролем "tester111"
		Допустим существует пользователь c:
			| email    | tester1@test.com |
			| password | tester     |
		  И я на странице Авторизация
		Если я ввожу в поле "user_session[login]" значение "tester1@test.com"
		  И ввожу в поле "user_session[password]" значение "notester-err-pass"
		  И кликаю кнопку "Войти"
		То должен увидеть текст "Неправильный логин или пароль"
			И пользователь с email "tester1@test.com" не должен быть аунтентифицирован

	Сценарий: Зарегистрированный, но неактивный пользователь не может войти на сайт 
		#Допустим я пользователь c e-mail "test@test.com" и паролем "tester111"
		Допустим существует пользователь c:
			| email    | tester1@test.com |
			| password | tester     |
			| disabled   | true |
		  И я на странице Авторизация
		Если я ввожу в поле "user_session[login]" значение "tester1@test.com"
		  И ввожу в поле "user_session[password]" значение "notester"
		  И кликаю кнопку "Войти"
		То пользователь с email "tester1@test.com" не должен быть аунтентифицирован
			И должен увидеть текст "Неправильный логин или пароль"

	Сценарий: Не зарегистрированный пользователь не может войти на сайт 
		Допустим я на странице Авторизация
		Если я ввожу в поле "user_session[login]" значение "novalid_user"
		  И ввожу в поле "user_session[password]" значение "novalidpass"
		  И кликаю кнопку "Войти"
		То пользователь "novalid_user" не должен быть аунтентифицирован
			И должен увидеть текст "Неправильный логин или пароль"

	Сценарий: После успешной авторизации пользователь должен перейти на Главную страницу
		Если я зарегистрированный пользователь и вхожу на сайт
		То я должен оказаться на странице Главная

	Сценарий: При ошибке входа пользователь должен остаться на странице Авторизации 
		Если я не зарегистрированный пользователь и вхожу на сайт
		То я должен оказаться на странице Авторизация 
		

	Сценарий: Регистрация  
		Допустим я на странице Регистрация
		Если я ввожу следующие значения: 
			| user[login]    | new_user     |
			| user[email]    | new@gmail.com|
			| user[password] | password     |
			| user[password_confirmation] | password     |
			| user[name]     | Василий Андреевич     |
			И кликаю кнопку "Регистрация"
		То должен быть создан пользователь "new_user"
#!!!			#			И я должен оказаться на странице Мой профиль
		  И я должен увидеть сообщение "Регистрация завершена успешно"
		#То должен быть создан пользователь "new_user" с: 
		#  | name      | value        |
		#	| login     | new_user     |
		#	| email     | new@gmail.com|
		#	| name      | Василий Андреевич     |


	Сценарий: Забыл пароль
		Допустим существует пользователь с e-mail "new@gmail.com"
		  И я на странице Восстановление пароля 
		Если я ввожу "new@gmail.com" в поле "email" 
			И кликаю кнопку "Отправить"
		То я должен увидеть сообщение "Новый пароль отправлен на < new@gmail.com >"


	Сценарий: Забыл несуществующий пароль
		Допустим нет пользователя с e-mail "new@gmail.com"
		  И я на странице Восстановление пароля 
		Если я ввожу "new@gmail.com" в поле "email" 
			И кликаю кнопку "Отправить"
		То я должен увидеть сообщение "На сайте нет пользователя с почтой < new@gmail.com >"

