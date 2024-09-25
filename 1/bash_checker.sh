#!/bin/bash

# Список вебсайтів
sites=("https://google.com" "https://facebook.com" "https://twitter.com" "https://schos_take.com")

# Назва файлу логів
logfile="website_status.log"

# Очищаємо файл логів перед записом нових даних
> "$logfile"

# Функція для перевірки статусу сайту
check_site() {
    # Перевірка наявності файлу
    if curl -s -L -I "$1" | grep "HTTP.* 200" > /dev/null; then
        # Запис лог-файлу
        echo "$1 is UP" >> "$logfile"
    else
        # Запис лог-файлу
        echo "$1 is DOWN" >> "$logfile"
    fi
}

# Перебір кожного сайту з масиву та виклик функції check_site
echo "Починаємо перевірку сайтів"
for site in "${sites[@]}"; do
    check_site "$site"
done
# Виводимо повідомлення про те, що результати записано у файл логів
echo "Результати перевірки записано у файл $logfile"