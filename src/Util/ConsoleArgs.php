<?php
/**
 * This file is part of phpUnderControl.
 * 
 * PHP Version 5.2.4
 *
 * Copyright (c) 2007-2008, Manuel Pichler <mapi@manuel-pichler.de>.
 * All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted provided that the following conditions
 * are met:
 *
 *   * Redistributions of source code must retain the above copyright
 *     notice, this list of conditions and the following disclaimer.
 *
 *   * Redistributions in binary form must reproduce the above copyright
 *     notice, this list of conditions and the following disclaimer in
 *     the documentation and/or other materials provided with the
 *     distribution.
 *
 *   * Neither the name of Manuel Pichler nor the names of his
 *     contributors may be used to endorse or promote products derived
 *     from this software without specific prior written permission.
 *
 * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
 * "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
 * LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS
 * FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE
 * COPYRIGHT OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT,
 * INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING,
 * BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
 * LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER
 * CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT
 * LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN
 * ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE
 * POSSIBILITY OF SUCH DAMAGE.
 *
 * @category  QualityAssurance 
 * @package   Util
 * @author    Manuel Pichler <mapi@manuel-pichler.de>
 * @copyright 2007-2008 Manuel Pichler. All rights reserved.
 * @license   http://www.opensource.org/licenses/bsd-license.php  BSD License
 * @version   SVN: $Id$
 * @link      http://www.phpundercontrol.org/
 */

/**
 * Utility class that handles the command line arguments for this tool.
 *
 * @category  QualityAssurance
 * @package   Util
 * @author    Manuel Pichler <mapi@manuel-pichler.de>
 * @copyright 2007-2008 Manuel Pichler. All rights reserved.
 * @license   http://www.opensource.org/licenses/bsd-license.php  BSD License
 * @version   Release: @package_version@
 * @link      http://www.phpundercontrol.org/
 * 
 * @property-read string $command   The specified command.
 * @property-read array  $options   List of command line options.
 * @property-read array  $arguments List of command line arguments.
 */
class phpucConsoleArgs
{
    /**
     * List of properties read from the command line interface.
     *
     * @type array<mixed>
     * @var array(string=>mixed) $properties
     */
    private $properties = array(
        'command'    =>  null,
        'options'    =>  array(),
        'arguments'  =>  array()
    );
    
    /**
     * Constructs a cli arguments object
     *
     * @param string                $command   The given command.
     * @param array(string=>mixed)  $options   The given command line options.
     * @param array(string=>string) $arguments The given command line arguments.
     */
    public function __construct( $command, array $options, array $arguments )
    {
        $this->properties = array(
            'command'    =>  $command,
            'options'    =>  $options,
            'arguments'  =>  $arguments
        );
    }
    
    /**
     * Checks if a value for <b>$name</b> exists.
     *
     * @param string $name The argument identifier.
     * 
     * @return boolean
     */
    public function hasArgument( $name )
    {
        return isset( $this->properties['arguments'][$name] );
    }
    
    /**
     * Returns the value of the argument identified by <b>$name</b>.
     *
     * @param string $name The argument identifier.
     * 
     * @return string 
     * @throws OutOfRangeException If no entry exists for $name.
     */
    public function getArgument( $name )
    {
        if ( $this->hasArgument( $name ) )
        {
            return $this->properties['arguments'][$name];
        }
        throw new OutOfRangeException(
            sprintf( 'Unknown argument "%s"."', $name )
        );
    }
    
    /**
     * Checks if a value for <b>$name</b> exists.
     *
     * @param string $name The option identifier.
     * 
     * @return boolean
     */
    public function hasOption( $name )
    {
        return isset( $this->properties['options'][$name] );
    }
    
    /**
     * Returns the value of the option identified by <b>$name</b>.
     *
     * @param string $name The option identifier.
     * 
     * @return string 
     * @throws OutOfRangeException If no entry exists for $name.
     */
    public function getOption( $name )
    {
        if ( $this->hasOption( $name ) )
        {
            return $this->properties['options'][$name];
        }
        throw new OutOfRangeException(
            sprintf( 'Unknown option "%s"."', $name )
        );
    }
    
    /**
     * Magic property getter method.
     *
     * @param string $name The property name.
     * 
     * @return mixed
     * @throws OutOfRangeException If the requested property doesn't exist or
     *         is writonly.
     */
    public function __get( $name )
    {
        if ( array_key_exists( $name, $this->properties ) === true )
        {
            return $this->properties[$name];
        }
        throw new OutOfRangeException(
            sprintf( 'Unknown or writonly property $%s.', $name )
        );
    }
}