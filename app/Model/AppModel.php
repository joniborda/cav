<?php
/**
 * Application model for Cake.
 *
 * This file is application-wide model file. You can put all
 * application-wide model-related methods here.
 *
 * PHP 5
 *
 * CakePHP(tm) : Rapid Development Framework (http://cakephp.org)
 * Copyright (c) Cake Software Foundation, Inc. (http://cakefoundation.org)
 *
 * Licensed under The MIT License
 * For full copyright and license information, please see the LICENSE.txt
 * Redistributions of files must retain the above copyright notice.
 *
 * @copyright     Copyright (c) Cake Software Foundation, Inc. (http://cakefoundation.org)
 * @link          http://cakephp.org CakePHP(tm) Project
 * @package       app.Model
 * @since         CakePHP(tm) v 0.2.9
 * @license       http://www.opensource.org/licenses/mit-license.php MIT License
 */

App::uses('Model', 'Model');

/**
 * Application model for Cake.
 *
 * Add your application-wide methods in the class below, your models
 * will inherit them.
 *
 * @package       app.Model
 */
class AppModel extends Model {

	/**
	 * Desde el campo pasado como string busco la provincia, departamento, localidad
	 * 
	 * @param String $field
	 * @return string
	 */
	protected function __search_ubicacion($field) {
		$split = split(',',$field);
		
		$query = 'SELECT l.cod_loc ' .
				'FROM unificado.provincias AS p '.
				'LEFT JOIN unificado.departamentos_g AS d ON d.cod_prov = p.cod_pcia_relacion ' .
				'LEFT JOIN unificado.localidades AS l ON d.cod_depto = l.cod_dpto ' .
				'WHERE l.cod_dpto NOT IN(2008,2011,2013,2012,2003,2015,2014,2002,2007,2018,2017,2016,2010,2009,2001,2004,2021,2006,2020,2019,2005) ' .
				'AND (';
		switch (count($split)) {
			case 3:
				$query .= 'CONCAT(trim(descripcion), \', \', TRIM(nom_depto), \', \', TRIM(nom_loc)) ILIKE \'%' . pg_escape_string ( trim($field) ) . '%\' ';
				break;
			case 2:
				// provincia, departamento
				$query .= '(TRIM(nom_depto)		 	ILIKE \'%' . pg_escape_string (trim( $split[1]) ) . '%\' ' .
						'AND TRIM(descripcion) 		ILIKE \'%' . pg_escape_string ( trim($split[0]) ) . '%\' )' .
						// departamento, localidad
				'OR (TRIM(nom_loc)		 	ILIKE \'%' . pg_escape_string (trim( $split[1]) ) . '%\' ' .
				'AND TRIM(nom_depto) 		ILIKE \'%' . pg_escape_string ( trim($split[0]) ) . '%\' )'.
				// provincia, localidad
				'OR (TRIM(nom_loc)		 	ILIKE \'%' . pg_escape_string (trim( $split[1]) ) . '%\' ' .
				'AND TRIM(descripcion) 		ILIKE \'%' . pg_escape_string ( trim($split[0]) ) . '%\' )';
				break;
			case 1:
				// solo por provincia
				$query .= 'TRIM(descripcion) 		ILIKE \'%' . pg_escape_string (trim( $split[0]) ) . '%\' ';
		}
		$query .= ')';
		
		return $query;
	}
}
