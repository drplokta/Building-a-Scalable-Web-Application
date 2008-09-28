<?php

// This is the main application configuration. Any writable
// application properties can be configured here.
return array(
	'basePath'=>dirname(__FILE__).DIRECTORY_SEPARATOR.'..',
	'name'=>'My Web Application',
	'import'=>array(
		'application.models.*',
	),
	'defaultController'=>'home',
	'components'=>array(
		'user'=>array(
			'class'=>'application.components.WebUser',
			'allowAutoLogin'=>true, // enable cookie-based login
			'loginUrl'=>array('user/login'),
		),
		'db'=>array(
			'class'=>'system.db.CDbConnection',
			'connectionString'=>'sqlite:'.dirname(__FILE__).'/../data/source.db',
		),
		'assetManager'=>array(
			'basePath'=>dirname(__FILE__).'/../../assets',
		),
	),
);