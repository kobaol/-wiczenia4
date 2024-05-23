#!/bin/bash

case "$1" in
    --date | -d)
        echo "Сегодняшняя дата: $(date)"
        ;;
    --logs | -l)
        if [ -z "$2" ]; тогда
            num_files=100
        else
            num_files=$2
        fi
        for ((i=1; i<=num_files; i++))
        do
            filename="log${i}.txt"
            echo "Имя файла: ${filename}" > $filename
            echo "Имя скрипта: skrypt.sh" >> $filename
            echo "Дата: $(date)" >> $filename
        done
        ;;
    --help | -h)
        echo "Доступные опции:"
        echo "--date, -d          Выводит сегодняшнюю дату"
        echo "--logs [n], -l [n]  Создает n файлов logx.txt (по умолчанию 100)"
        echo "--init              Клонирует репозиторий и добавляет путь в PATH"
        echo "--error [n], -e [n] Создает n файлов errorx/errorx.txt (по умолчанию 100)"
        echo "--help, -h          Выводит справку"
        ;;
    --init)
        git clone https://github.com/your_username/myrepo.git $(pwd)
        export PATH=$PATH:$(pwd)
        ;;
    --error | -e)
        if [ -z "$2" ]; тогда
            num_files=100
        else
            num_files=$2
        fi
        for ((i=1; i<=num_files; i++))
        do
            mkdir -p "error${i}"
            filename="error${i}/error${i}.txt"
            echo "Имя файла: ${filename}" > $filename
            echo "Имя скрипта: skrypt.sh" >> $filename
            echo "Дата: $(date)" >> $filename
        done
        ;;
    *)
        echo "Неизвестная опция. Используйте --help, чтобы вывести доступные опции."
        ;;
esac
