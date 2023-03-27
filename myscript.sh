MIN_SIZE=$1
MIN_DATE=$2

ALL_FILES=$(find . -type f -size +${MIN_SIZE}c -newermt ${MIN_DATE})

if [ -z "$ALL_FILES" ]; then
  echo "Файлы для удаления не найдены."
  exit 0
else
  echo "Список файлов, размер которых больше ${MIN_SIZE} байт и которые были созданы позднее ${MIN_DATE}:"
  echo "$ALL_FILES"
fi

read -p "Хотите удалить какие-то файлы? (y/n) " RESPONSE
if [ "$RESPONSE" == "y" ]; then
  read -p "Введите список файлов, которые нужно удалить (через пробел): " FILES_TO_DELETE
  for FILE in $FILES_TO_DELETE; do
    if echo "$ALL_FILES" | grep -q "^$FILE$"; then
      rm -i "$FILE"
    else
      echo "Файл $FILE не соответствует заданным критериям поиска и не будет удален."
    fi
  done
else
  echo "Удаление файлов отменено."
fi

echo "Список файлов в текущей директории:"
ls -l
