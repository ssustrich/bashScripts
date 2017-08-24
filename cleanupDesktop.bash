#!/bin/bash
imageFileExts="png jpe\?g bme\?p gif"
documentFileExts="docx\? html\? txt pdf xps pptx\?"
downloadsFileExts="zip exe msi 7z"
developmentFileExts="java class py ipynb ear json xml patch"
for file in *
  do
    for ext in $imageFileExts
      do
        if echo $file | grep -qi "\.${ext}$"
          then
            mv -i "$file" ../Pictures/
        fi
      done
    for ext in $documentFileExts
      do
         if echo $file | grep -qi "\.${ext}$"
           then
             mv -i "$file" ../Documents/
         fi
      done
	
    for ext in $downloadsFileExts
      do
        if echo $file | grep -qi "\.${ext}$"
          then
            mv -i "$file" ../Downloads/
        fi
      done
    for ext in $developmentFileExts
      do
        if echo $file | grep -qi "\.${ext}$"
          then
            mv -i "$file" /mnt/d/Development/
        fi
      done
done

