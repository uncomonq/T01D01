touch src/quest3.sh
# Создание необходимых директорий
mkdir -p door_management_files/door_configuration
mkdir -p door_management_files/door_map
mkdir -p door_management_files/door_logs
# Добавление тестовых конфигурационных файлов
echo "config=door_1" > door_management_files/door_configuration/main.conf
# Добавление карты дверей
echo "Door map version 1.1" > door_management_files/door_map/door_map_1.1
# Добавление логов
echo "Door opened successfully" > door_management_files/door_logs/door_1.log

# Создание дополнительных .conf файлов (30 штук)
for i in {2..30}
do
  echo "config=door_$i" > door_management_files/door_configuration/door_$i.conf
done

# Создание дополнительных .log файлов (2 штуки, вместе с door_1.log будет 3)
for i in {2..3}
do
  echo "Door log $i" > door_management_files/door_logs/door_$i.log
done
