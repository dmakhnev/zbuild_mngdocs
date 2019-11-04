﻿///////////////////////////////////////////////////////////////////////////////////////////////////////
// Copyright (c) 2019, ООО 1С-Софт
// Все права защищены. Эта программа и сопроводительные материалы предоставляются 
// в соответствии с условиями лицензии Attribution 4.0 International (CC BY 4.0)
// Текст лицензии доступен по ссылке:
// https://creativecommons.org/licenses/by/4.0/legalcode
///////////////////////////////////////////////////////////////////////////////////////////////////////

#Область СлужебныеПроцедурыИФункции

// Функция получает цвет стиля по имени элемента стиля.
//
// Параметры:
//   ИмяЦветаСтиля - Строка -  Имя элемента стиля.
//
// Возвращаемое значение:
//   Цвет - .
//
Функция ЦветСтиля(ИмяЦветаСтиля) Экспорт
	
	Возврат ОбщегоНазначенияВызовСервера.ЦветСтиля(ИмяЦветаСтиля);
	
КонецФункции

// Функция получает шрифт стиля по имени элемента стиля.
//
// Параметры:
//   ИмяШрифтаСтиля - Строка - Имя шрифта стиля.
//
// Возвращаемое значение:
//   Шрифт - .
//
Функция ШрифтСтиля(ИмяШрифтаСтиля) Экспорт
	
	Возврат ОбщегоНазначенияВызовСервера.ШрифтСтиля(ИмяШрифтаСтиля);
	
КонецФункции

#КонецОбласти
