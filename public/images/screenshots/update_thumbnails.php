<?php
	include '../../include/utility/gen_thumb.inc.php';

	if($dh = opendir('.')) {
		$files = array();
		while(false !== ($file = readdir($dh))) {
			if($file != '.' and $file != '..' and !strpos($file, 'thumb')) $files[] = $file;
		}

		arsort($files); // abc order, grouping together common versions

		foreach($files as $file) {
			// generate new file name of *.thumb.0.jpg from *.0.jpg
			preg_match("/([0-9a-zA-Z\-\.]+)\.([0-9]+)\.(jpg|png)$/", $file, $matches);

			$name = $matches[1];
			$number = $matches[2];
			$extension = $matches[3];

			$new = $name.'.thumb.'.$number.'.'.$extension;

			echo chr(10).chr(10);

			gen_thumb($file, $new, 180);
		}

		closedir($dh);
	}

