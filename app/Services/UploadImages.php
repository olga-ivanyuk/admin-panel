<?php

namespace App\Services;

use Illuminate\Support\Facades\Storage;

class UploadImages
{
    public static function upload($files, $mainFolder, $updateBlocksArray)
    {
            foreach ($files as $blockId => $options) {
                foreach ($options as $langId => $imageArray) {
                    foreach ($imageArray as $fieldName => $image) {
                        $folder = "$mainFolder/$blockId/$langId/$fieldName";
                        $fileName = $image->getClientOriginalName();
                        Storage::disk('public')->putFileAs($folder, $image, $fileName);
                        $updateBlocksArray[$blockId]['options'][$langId][$fieldName] = asset("storage/$folder/$fileName");
                    }
                }
            }
            return $updateBlocksArray;
        }
}
