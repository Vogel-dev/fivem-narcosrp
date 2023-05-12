Locales['pl'] = {
  -- Cloakroom
  ['cloakroom'] = 'szatnia',
  ['citizen_wear'] = 'ubranie Cywilne',
  ['police_wear'] = 'mundur',
  ['gilet_wear'] = 'kamizelka odblaskowa',
  ['bullet_wear'] = 'kamizelka kuloodporna',
  ['no_outfit'] = 'brak ubrania',
  ['open_cloackroom'] = 'wciśnij ~INPUT_CONTEXT~ aby zmienić ~y~ubranie~s~.',
  -- Armory
  ['remove_object'] = 'weź przedmiot',
  ['deposit_object'] = 'zdeponuj przedmiot',
  ['get_weapon'] = 'weź broń',
  ['put_weapon'] = 'odłóż broń',
  ['buy_weapons'] = 'kup Broń',
  ['armory'] = 'zbrojownia',
  ['open_armory'] = 'wciśnij ~INPUT_CONTEXT~ żeby uzyskać dostęp do zbrojowni',
  -- Vehicles
  ['vehicle_menu'] = 'pojazdy',
  ['vehicle_out'] = 'masz już pojazd poza garażem',
  ['vehicle_spawner'] = 'wciśnij ~INPUT_CONTEXT~ żeby wziąć pojazd',
  ['store_vehicle'] = 'wciśnij ~INPUT_CONTEXT~ żeby przechować pojazd',
  -- Service
  ['service_max'] = 'you cannot enter service, max officers in service: %s/%s',
  ['service_not'] = 'you have not entered service! You\'ll have to get changed first.',
  ['service_anonunce'] = 'service information',
  ['service_in'] = 'you\'ve entered service, welcome!',
  ['service_in_announce'] = 'operator ~y~%s~s~ has entered service!',
  ['service_out'] = 'you have left service.',
  ['service_out_announce'] = 'operator ~y~%s~s~ has left their service.',
  -- Action Menu
  ['citizen_interaction'] = 'interakcja z cywilami',
  ['vehicle_interaction'] = 'interakcja z pojazdami',
  ['object_spawner'] = 'przedmioty do postawienia',

  ['id_card'] = 'dowód osobisty',
  ['search'] = 'przeszukaj',
  ['handcuff'] = 'zakuj/Rozkuj Kajdanki ',
  ['drag'] = 'przemieść podejrzanego',
  ['put_in_vehicle'] = 'wsadź do pojazdu',
  ['out_the_vehicle'] = 'wyciągnij z pojazdu',
  ['fine'] = 'mandaty',
  ['unpaid_bills'] = 'zarządzaj niezapłaconymi rachunkami',
  ['license_check'] = 'zarządzaj licencjami',
  ['license_revoke'] = 'unieważnij licencje',
  ['license_revoked'] = 'twoja licencja ~b~%s~s~ została ~y~unieważniona~s~!',
  ['licence_you_revoked'] = 'unieważniłeś ~b~%s~s~ które należały do ~y~%s~s~',
  ['no_players_nearby'] = 'brak graczy w pobliżu',
  ['being_searched'] = 'Zostałeś ~y~przeszukany~s~ przez ~b~policję~s~',
  -- Vehicle interaction
  ['vehicle_info'] = 'informacje o pojeździe',
  ['pick_lock'] = 'odblokuj pojazd',
  ['vehicle_unlocked'] = 'pojazd ~g~Odblokowany~s~',
  ['no_vehicles_nearby'] = 'brak pojazdu w pobliżu',
  ['impound'] = 'zajmij pojazd',
  ['impound_prompt'] = 'wciśnij ~INPUT_CONTEXT~ żeby unieważnić ~y~zajęcie~s~',
  ['impound_canceled'] = 'unieważniłeś/aś zajęcie',
  ['impound_canceled_moved'] = 'zajęcie zostało anulowane, ponieważ pojazd przemieścił się',
  ['impound_successful'] = 'zająłeś/aś pojazd',
  ['search_database'] = 'informacje o pojeździe',
  ['search_database_title'] = 'informacjeo pojeździe - przeszukaj używając numeru rejestracyjnego',
  ['search_database_error_invalid'] = 'to ~r~nie~s~ jest ~y~poprawny~s~ rnumer rejestracyjny',
  ['search_database_error_not_found'] = 'ten ~y~numer rejestracyjny~s~  ~r~nie jest~s~ zarejestrowany do tego pojazdu!',
  ['search_database_found'] = 'pojazd jest ~y~zarejestrowany~s~ do ~b~%s~s~',
  -- Traffic interaction
  ['traffic_interaction'] = 'interakcje dla ruchu drogowego',
  ['cone'] = 'pachołek',
  ['barrier'] = 'barierka',
  ['spikestrips'] = 'kolczatka',
  ['box'] = 'pudła',
  ['cash'] = 'paleta z pieniędzmi',
  -- ID Card Menu
  ['name'] = 'Dane: %s',
  ['job'] = 'Praca: %s',
  ['sex'] = 'płeć: %s',
  ['dob'] = 'data urodzenia: %s',
  ['height'] = 'wzrost: %s',
  ['id'] = 'iD: %s',
  ['bac'] = 'bAC: %s',
  ['unknown'] = 'nieznany',
  ['male'] = 'mężczyzna',
  ['female'] = 'kobieta',
  -- Body Search Menu
  ['guns_label'] = '--- Bronie ---',
  ['inventory_label'] = '--- Ekwipunek ---',
  ['license_label'] = ' --- Licencje ---',
  ['confiscate'] = 'skonfiskuj %s',
  ['confiscate_weapon'] = 'skonfiskuj %s z %s kulami',
  ['confiscate_inv'] = 'skonfiskuj %s x %s',
  ['confiscate_dirty'] = 'skonfiskuj brudne pieniądze: <span style="color:red;">$%s</span>',
  ['you_confiscated'] = 'skonfiskowałeś ~y~%sx~s~ ~b~%s~s~ od ~b~%s~s~',
  ['got_confiscated'] = '~y~%sx~s~ ~b~%s~s~ zostały skonfiskowane przez ~y~%s~s~',
  ['you_confiscated_account'] = 'skonfiskowałeś ~g~%s$~s~ (%s) od ~b~%s~s~',
  ['got_confiscated_account'] = '~g~%s$~s~ (%s) zostały skonfiskowane przez ~y~%s~s~',
  ['you_confiscated_weapon'] = 'skonfiskowałeś ~b~%s~s~ od ~b~%s~s~ z ~o~%s~s~ pociskami',
  ['got_confiscated_weapon'] = 'twój ~b~%s~s~ z ~o~%s~s~ kulami został skonfiskowany przez ~y~%s~s~',
  ['traffic_offense'] = 'wykroczenia drogowe',
  ['minor_offense'] = 'niewielkie wykroczenia',
  ['average_offense'] = 'średnie wykroczenia',
  ['major_offense'] = 'duże wykroczenia',
  ['fine_total'] = 'mandat: %s',
  -- Vehicle Info Menu
  ['plate'] = 'tablica rejestracyjna: %s',
  ['owner_unknown'] = 'właściciel: Nieznany',
  ['owner'] = 'właściciel: %s',
  -- Weapons Menus
  ['get_weapon_menu'] = 'zbrojownia - Weź broń',
  ['put_weapon_menu'] = 'zbrojownia - Odłóż broń',
  ['buy_weapon_menu'] = 'zbrojownia - Kup broń',
  ['not_enough_money'] = 'nie masz wystarczającej ilości pieniędzy',
  -- Boss Menu
  ['take_company_money'] = 'wypłać firmowe pieniądze',
  ['deposit_money'] = 'zdeponuj pieniądze',
  ['amount_of_withdrawal'] = 'wartość wypłaty',
  ['invalid_amount'] = 'nieprawidłowa wartość',
  ['amount_of_deposit'] = 'wartość depozytu',
  ['open_bossmenu'] = 'wciśnij ~INPUT_CONTEXT~ aby otworzyć menu',
  ['quantity_invalid'] = 'nieprawidłowa ilość',
  ['have_withdrawn'] = 'wyjmujesz z depozytu ~y~%sx~s~ ~b~%s~s~',
  ['have_deposited'] = 'zdeponowałeś ~y~%sx~s~ ~b~%s~s~',
  ['quantity'] = 'ilość',
  ['inventory'] = 'ekwipunek',
  ['police_stock'] = 'zapasy policji',
  -- Misc
  ['remove_prop'] = 'wciśnij ~INPUT_CONTEXT~ aby usunąć ten obiekt',
  ['map_blip'] = 'komisariat policji',
  ['unrestrained_timer'] = 'czujesz, że twoje kajdanki powoli tracą przyczepność i znikają.',
  -- Notifications
  ['alert_police'] = 'ostrzeż policję',
  ['phone_police'] = 'policja',
}
