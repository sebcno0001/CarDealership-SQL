# 🚗 System Bazy Danych dla Komisu Samochodowego

Projekt akademicki bazy danych MySQL dla systemu zarządzania komisem samochodowym.

## 📋 Opis projektu

Kompleksowy system bazodanowy zaprojektowany do obsługi komisu samochodowego, obejmujący zarządzanie:
- Flotą samochodów
- Pracownikami (serwisanci, sprzedawcy, księgowi)
- Klientami i ich transakcjami
- Naprawami i częściami zamiennymi
- Wyposażeniem pojazdów

## 🗂️ Struktura bazy danych

### Główne tabele:

#### 👥 **Zarządzanie personelem**
- `pracownicy` - podstawowe dane pracowników z hierarchią przełożonych
- `serwisanci` - specjalizacje mechaników
- `sprzedawcy` - informacje o sprzedawcach (czy skupują pojazdy)
- `ksiegowi` - księgowi i informacja czy pracują w innych firmach

#### 🚘 **Zarządzanie pojazdami**
- `samochody` - dane pojazdów (VIN, model, przebieg)
- `marki` - producenci samochodów (VW, BMW, Mercedes, etc.)
- `silniki` - specyfikacja silników (moc, moment obrotowy, pojemność)
- `wyposazenie` - wyposażenie pojazdów (klimatyzacja, tapicerka, radio)

#### 💰 **Transakcje i klienci**
- `klienci` - dane osobowe klientów
- `adres_klienta` - adresy zamieszkania
- `nr_telefonu` - numery kontaktowe (relacja wiele-do-wielu)
- `transakcje` - sprzedaż i zakup pojazdów
- `informacje_transakcja` - szczegóły transakcji z datami

#### 🔧 **Serwis**
- `naprawy` - wykonane naprawy z opisami i kosztami
- `czesci` - użyte części zamienne w naprawach

## 📊 Diagram ERD

### Kluczowe relacje:
```
pracownicy (1) -----> (N) serwisanci
pracownicy (1) -----> (N) sprzedawcy
pracownicy (1) -----> (N) ksiegowi
pracownicy (1) -----> (N) pracownicy (przełożony)

marki (1) -----> (N) samochody
silniki (1) -----> (1) samochody
samochody (1) -----> (1) wyposazenie
samochody (1) -----> (N) transakcje
samochody (1) -----> (N) naprawy

serwisanci (1) -----> (N) naprawy
naprawy (1) -----> (N) czesci

sprzedawcy (1) -----> (N) transakcje
transakcje (1) -----> (1) informacje_transakcja
klienci (1) -----> (1) adres_klienta
klienci (1) -----> (N) nr_telefonu
klienci (1) -----> (N) informacje_transakcja
```

## 🚀 Instalacja i uruchomienie

### Wymagania:
- MySQL Server (wersja 5.7+) lub MariaDB (10.4+)
- phpMyAdmin (opcjonalnie)
- Klient MySQL (mysql-cli lub MySQL Workbench)

### Instalacja:

1. **Sklonuj repozytorium:**
```bash
git clone https://github.com/twoj-username/komis-database.git
cd komis-database
```

2. **Utwórz bazę danych:**
```sql
CREATE DATABASE komis CHARACTER SET utf8 COLLATE utf8_polish_ci;
```

3. **Zaimportuj strukturę i dane:**
```bash
mysql -u root -p komis < awaryjne.sql
```

Lub za pomocą phpMyAdmin:
- Otwórz phpMyAdmin
- Wybierz bazę `komis`
- Zakładka "Import"
- Wybierz plik `awaryjne.sql`

## 📝 Przykładowe zapytania

### 1. Lista wszystkich samochodów z markami i cenami:
```sql
SELECT s.VIN, m.Nazwa_marki, s.Model, s.Rocznik, s.Przebieg, t.Koszt
FROM samochody s
JOIN marki m ON s.Id_marki = m.Id_marki
JOIN transakcje t ON s.VIN = t.VIN
ORDER BY m.Nazwa_marki, s.Model;
```

### 2. Pracownicy z najwyższymi zarobkami:
```sql
SELECT Imie, Nazwisko, Wyksztalcenie, Zarobki
FROM pracownicy
ORDER BY Zarobki DESC
LIMIT 10;
```

### 3. Historia napraw dla konkretnego pojazdu:
```sql
SELECT n.Id_naprawy, n.Opis, n.Koszt, n.PESEL_serwisanta,
       p.Imie, p.Nazwisko, s.Specjalizacja
FROM naprawy n
JOIN serwisanci s ON n.PESEL_serwisanta = s.PESEL
JOIN pracownicy p ON s.PESEL = p.PESEL
WHERE n.VIN = '1HGCM82633A123456';
```

### 4. Zestawienie transakcji z klientami:
```sql
SELECT k.Imie, k.Nazwisko, t.Rodzaj_transakcji, t.Koszt, 
       it.Data_transakcji, s.Model, m.Nazwa_marki
FROM informacje_transakcja it
JOIN klienci k ON it.PESEL = k.PESEL
JOIN transakcje t ON it.Id_transakcji = t.Id_transakcji
JOIN samochody s ON t.VIN = s.VIN
JOIN marki m ON s.Id_marki = m.Id_marki
ORDER BY it.Data_transakcji DESC;
```

## 📈 Statystyki projektu

- **15 tabel** z pełną strukturą relacyjną
- **156 rekordów** danych testowych
- **16 marek** samochodów
- **15 pojazdów** w bazie
- **17 klientów**
- **15 transakcji** (sprzedaż/kupno)
- **15 napraw** z częściami zamiennymi


## 🛠️ Technologie

- **MySQL** / MariaDB
- **phpMyAdmin** (do zarządzania)
- **SQL** (DDL, DML)
- Kodowanie: UTF-8 (polish_ci)

## 📄 Licencja

Projekt edukacyjny - wolne użytkowanie dla celów akademickich.

## 👤 Autor

Sebastian Cnotalski
- GitHub: [https://github.com/sebcno0001]

---

⭐ Jeśli projekt Ci się podoba, zostaw gwiazdkę!
