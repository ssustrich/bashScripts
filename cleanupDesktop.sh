#!/bin/bash
imageFileExts="png jpe\?g bmp gif xcf"
videoFileExts="mp4"
musicFileExts="mp3"
documentFileExts="docx\? html\? txt pdf xps pptx\? properties xlsx\? xlsm csv"
downloadsFileExts="iso zip exe msi 7z gz"
developmentFileExts="jar java class pyc\? ipynb ear json xml patch jar tar"
for file in *
  do
    echo $file
    for ext in $imageFileExts
      do
        if echo $file | grep -qi "\.${ext}$"
          then
		  if [[ -e "../Pictures/$file" ]] ; then
			i=0
			fname="${file%.*}"
			fext="${file##*.}"
			while [[ -e "../Pictures/$fname-$i.$fext" ]] ; do
				let i++
				echo $i
			done
			fname="$fname-$i"
			echo $fname
			echo $fext
		  fi
		  echo "Moving $file to ../Pictures/$fname.$fext"
          mv -i "$file" ../Pictures/$fname.$fext
        fi
      done

    for ext in $videoFileExts
      do
        if echo $file | grep -qi "\.${ext}$"
		then
		  if [[ -e "../Videos/$file" ]] ; then
			i=0
			fname="${file%.*}"
			fext="${file##*.}"
			while [[ -e "../Videos/$fname-$i.$fext" ]] ; do
				let i++
				echo $i
			done
			fname="$fname-$i"
		  fi
		  echo "Moving $file to ../Videos/$fname.$fext"
          mv -i "$file" ../Videos/$fname.$fext
        fi
    done

    for ext in $musicFileExts
      do
	    if echo $file | grep -qi "\.${ext}$"
		then
		  if [[ -e "../Music/$file" ]] ; then
			i=0
			fname="${file%.*}"
			fext="${file##*.}"
			while [[ -e "../Music/$fname-$i.$fext" ]] ; do
				let i++
			done
			fname="$fname-$i"
		  fi
		  echo "Moving $file to ../Music/$fname.$fext"
          mv -i "$file" ../Music/$fname.$fext
        fi

    done

    for ext in $documentFileExts
      do
	    if echo $file | grep -qi "\.${ext}$"
		then
		  if [[ -e "../Documents/$file" ]] ; then
			i=0
			fname="${file%.*}"
			fext="${file##*.}"
			while [[ -e "../Docuemnts/$fname-$i.$fext" ]] ; do
				let i++
			done
			fname="$fname-$i"
		  fi
		  echo "Moving $file to ../Documents/$fname.$fext"
          mv -i "$file" ../Documents/$fname.$fext
        fi
      done

    for ext in $downloadsFileExts
      do
        if echo $file | grep -qi "\.${ext}$"
          then
            if [[ -e "../Downloads/$file" ]] ; then
			i=0
			fname="${file%.*}"
			fext="${file##*.}"
			while [[ -e "../Dosloads/$fname-$i.$fext" ]] ; do
				let i++
			done
			fname="$fname-$i"
		  fi
		  echo "Moving $file to ../Downloads/$fname.$fext"
          mv -i "$file" ../Downloads/$fname.$fext
        fi
      done

    for ext in $developmentFileExts
      do
        if echo $file | grep -qi "\.${ext}$"
          then
            if [[ -e "/mnt/d/Development/$file" ]] ; then
			i=0
			fname="${file%.*}"
			fext="${file##*.}"
			while [[ -e "/mnt/d/Development/$fname-$i.$fext" ]] ; do
				let i++
			done
			fname="$fname-$i"
		  fi
		  echo "Moving $file to /mnt/d/Development/$fname.$fext"
          mv -i "$file" /mnt/d/Development/$fname.$fext
        fi
      done  
done
