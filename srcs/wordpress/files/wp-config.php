<?php
/**
 * The base configuration for WordPress
 *
 * The wp-config.php creation script uses this file during the installation.
 * You don't have to use the web site, you can copy this file to "wp-config.php"
 * and fill in the values.
 *
 * This file contains the following configurations:
 *
 * * Database settings
 * * Secret keys
 * * Database table prefix
 * * ABSPATH
 *
 * @link https://wordpress.org/support/article/editing-wp-config-php/
 *
 * @package WordPress
 */

// ** Database settings - You can get this info from your web host ** //
/** The name of the database for WordPress */
define( 'DB_NAME', 'wordpress_db' );

/** Database username */
define( 'DB_USER', 'rcappend' );

/** Database password */
define( 'DB_PASSWORD', 'rcappend_password' );

/** Database hostname */
define( 'DB_HOST', 'mariadb' );

/** Database charset to use in creating database tables. */
define( 'DB_CHARSET', 'utf8' );

/** The database collate type. Don't change this if in doubt. */
define( 'DB_COLLATE', '' );

/**#@+
 * Authentication unique keys and salts.
 *
 * Change these to different unique phrases! You can generate these using
 * the {@link https://api.wordpress.org/secret-key/1.1/salt/ WordPress.org secret-key service}.
 *
 * You can change these at any point in time to invalidate all existing cookies.
 * This will force all users to have to log in again.
 *
 * @since 2.6.0
 */
define('AUTH_KEY',         '$yvEm4&}x-yrGvc9.K6M-X?sDk2Z<.j{-)tH-8]U@pFbH}7Jlt}q?ZFYf=,u+@8|');
define('SECURE_AUTH_KEY',  'mLiqwoxX:9:8y5ZATkvL2E&cXbZBrD-,!D-k/DdCb-nm|G(_-b/K|+>)T/|P%GI&');
define('LOGGED_IN_KEY',    'Np3DcUPgq,-&/(N}KP]$ |bph!#>?/$u~af(;`=6a|gvM/p+/*`0q#OU.D$cE$[b');
define('NONCE_KEY',        'jScrspPav$&8+wv>mR+:>OAU2Rc=Hm:E/6L}|*xu;3|KF_m,u%Jq{`vR8BF@U}v>');
define('AUTH_SALT',        '%Nb59vgZZPQ7LOb*E~CW+eSL~+0gaWfT+elLz{QmL-5H@/JTwl>+Ijv}+.C[gju`');
define('SECURE_AUTH_SALT', 'HS+oH?5|0GU2aQCC*?]XZZPSZ {}QPEc#LB<qqupNFsZpCQ>?&~fJa O{s?)*]FW');
define('LOGGED_IN_SALT',   'H;Vb>oQls0Z.EM)|NJAw`+hZ !+@;a-P1x4HMo@!o`Yb:d>zmIz&s]!9S5*E35Yb');
define('NONCE_SALT',       '),+i%NVwygb`+3e|LQpIz>J<!iOtOj!&-M|F:_xV>hEyI*`d#Knj]qv^4I=(k185');

/**#@-*/

/**
 * WordPress database table prefix.
 *
 * You can have multiple installations in one database if you give each
 * a unique prefix. Only numbers, letters, and underscores please!
 */
$table_prefix = 'wp_';

/**
 * For developers: WordPress debugging mode.
 *
 * Change this to true to enable the display of notices during development.
 * It is strongly recommended that plugin and theme developers use WP_DEBUG
 * in their development environments.
 *
 * For information on other constants that can be used for debugging,
 * visit the documentation.
 *
 * @link https://wordpress.org/support/article/debugging-in-wordpress/
 */
define( 'WP_DEBUG', false );

/* Add any custom values between this line and the "stop editing" line. */



/* That's all, stop editing! Happy publishing. */

/** Absolute path to the WordPress directory. */
if ( ! defined( 'ABSPATH' ) ) {
	define( 'ABSPATH', __DIR__ . '/' );
}

/** Sets up WordPress vars and included files. */
require_once ABSPATH . 'wp-settings.php';
