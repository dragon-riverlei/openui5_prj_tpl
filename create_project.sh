#!/usr/bin/bash

out_dir="new_project"
rm -rf $out_dir
mkdir $out_dir
while IFS='=' read -r key value
do
    case "$key" in
        TITLE)
            title="$value"
            ;;
        RESOURCE_ROOT)
            resource_root="$value"
            ;;
        ROOT_VIEW)
            root_view="$value"
            ;;
        COMPONENT_NAME)
            component_name="value"
            ;;
        COMPONENT_VERSION)
            component_version="$value"
            ;;
        *)
            ;;
    esac
done < tpl.properties

for f in $(find ! -path "*.git*" -type f -name "*.*")
do
    folder=$(dirname "$f")
    folder=$(basename "$folder")
    file=${f##*/}
    file=$(echo $file | sed "s/\${TITLE}/$title/g" | sed "s/\${RESOURCE_ROOT}/$resource_root/g" | \
        sed "s/\${ROOT_VIEW}/$root_view/g" | sed "s/\${COMPONENT_NAME}/$component_name/g" | \
        sed "s/\${COMPONENT_VERSION}/$component_version/g")
    #echo $file
    mkdir $out_dir/$folder
    cat $f | sed "s/\${TITLE}/$title/g" | sed "s/\${RESOURCE_ROOT}/$resource_root/g" | \
        sed "s/\${ROOT_VIEW}/$root_view/g" | sed "s/\${COMPONENT_NAME}/$component_name/g" | \
        sed "s/\${COMPONENT_VERSION}/$component_version/g" > $out_dir/$folder/$file
done
