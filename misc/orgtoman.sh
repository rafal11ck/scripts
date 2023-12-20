#!/usr/bin/env sh
# Convert org file to manpage
# Optionaly -i --insatll install it, mandb has to be refreshed manually
#do_install=false;


while [ $# -gt 0 ]; do
    case "$1" in
        -i | --install)
            [ $# -lt 1 ] && die "missing argument!"
            do_install=true;
            #echo "install"
            shift
            ;;
        -o | --output)
            [ $# -lt 2 ] && die "missing argument!"
            output_file="$1";
            shift
            ;;
         *)
            source_file="$1"
            [ ! -f "$source_file" ] &&
                echo "source file not found" &&
                exit
            shift
            ;;
    esac
done



emacs "$source_file" --batch -f org-md-export-to-markdown &&

md_file_path="$(dirname "$source_file")/$(basename "$source_file" .org).md" &&


if [ -z ${output_file+x} ]; then
    output_file="$(dirname "$source_file")/$(basename "$source_file" .org).1"
fi &&

pandoc "$md_file_path" -t man -o "$output_file" &&
rm "$md_file_path" &&
gzip "$output_file" &&


manpage_file="$output_file.gz" &&


if [ "$do_install" = true ] ; then
    mv "$manpage_file" "/usr/local/man/man1/"
fi
