#!/bin/bash
imageFileExts="png jpe\?g bmp gif xcf"
videoFileExts="mp4"
musicFileExts="mp3"
documentFileExts="docx\? html\? txt pdf xps pptx\? properties xlsx\?m\? csv"
downloadsFileExts="iso zip exe msi 7z gz"
developmentFileExts="jar java class pyc\? ipynb ear json xml patch jar tar"

ifFileExists () {
	i=0
	fileName = $1
	fname="${fileName%.*}"
	fext="${fileName##*.}"
	while [[ -e "../$2/$fname-$i.$fext" ]] ; do
		let i++
	done
	echo "Moving $file to ../$2/$fname.$fext"
    mv -i $file "../$2/$fname.$fext"
} 



for file in *
  do
    echo $file
    for ext in $imageFileExts
      do
        if echo $file | grep -qi "\.${ext}$"
          then
		  #if [[ -e "../Pictures/$file" ]] ; then
		#	ifFileExists "$file" "Pictures"
		  #fi
		  echo "Moving $file to ../Pictures/$fname.$fext"
          mv -i $file "../Pictures/$fname.$fext"
        fi
      done

    for ext in $videoFileExts
      do
        if echo $file | grep -qi "\.${ext}$"
		then
		  #if [[ -e "../Videos/$file" ]] ; then
		#	ifFileExists "$file" "Videos"
		  #fi
		  echo "Moving $file to ../Videos/$fname.$fext"
          mv -i "$file" ../Videos/$fname.$fext
        fi
    done

    for ext in $musicFileExts
      do
	    if echo $file | grep -qi "\.${ext}$"
		then
		  #if [[ -e "../Music/$file" ]] ; then
			#ifFileExists "$file" "Music"
		  #fi
		  echo "Moving $file to ../Music/$fname.$fext"
          mv -i "$file" ../Music/$fname.$fext
        fi

    done

    for ext in $documentFileExts
      do
	    if echo $file | grep -qi "\.${ext}$"
		then
		  #if [[ -e "../Documents/$file" ]] ; then
			#ifFileExists "$file" "Documents"
		  #fi
		  echo "Moving $file to ../Documents/$fname.$fext"
          mv -i "$file" "../Documents/$fname.$fext"
        fi
      done

    for ext in $downloadsFileExts
      do
        if echo $file | grep -qi "\.${ext}$"
          then
           # if [[ -e "../Downloads/$file" ]] ; then
			#	ifFileExists "$file" "Downloads"
		   # fi
		  echo "Moving $file to ../Downloads/$fname.$fext"
          mv -i "$file" ../Downloads/$fname.$fext
        fi
      done

    #for ext in $developmentFileExts
    #  do
    #    if echo $file | grep -qi "\.${ext}$"
	#	  fname="${file%.*}"
	#	  fext="${file##*.}"
    #      then
    #        if [[ -e "/mnt/d/Development/$file" ]] ; then
	#			ifDevFileExists "$file" "Development"
	#	  fi
	#	  echo "Moving $file to /mnt/d/Development/$fname.$fext"
    #      mv -i "$file" /mnt/d/Development/$fname.$fext
    #    fi
    #  done  
done
