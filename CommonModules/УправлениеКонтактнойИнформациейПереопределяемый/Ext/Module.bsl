﻿///////////////////////////////////////////////////////////////////////////////////////////////////////
// Copyright (c) 2019, ООО 1С-Софт
// Все права защищены. Эта программа и сопроводительные материалы предоставляются 
// в соответствии с условиями лицензии Attribution 4.0 International (CC BY 4.0)
// Текст лицензии доступен по ссылке:
// https://creativecommons.org/licenses/by/4.0/legalcode
///////////////////////////////////////////////////////////////////////////////////////////////////////

#Область ПрограммныйИнтерфейс

// Получает наименования видов контактной информации на разных языках.
//
// Параметры:
//  Наименования - Соответствие - представление вида контактной информации на переданном языке:
//     * Ключ     - Строка - Имя вида контактной информации. Например, "_ДемоАдресПартнера".
//     * Значение - Строка - Наименование вида контактной информации для переданного кода языка.
//  КодЯзыка - Строка - Код языка. Например, "en".
//
// Пример:
//  Наименования["_ДемоАдресПартнера"] = НСтр("ru='Адрес'; en='Address';", КодЯзыка);
//
Процедура ПриПолученииНаименованийВидовКонтактнойИнформации(Наименования, КодЯзыка) Экспорт
	
	
	
КонецПроцедуры

#КонецОбласти
