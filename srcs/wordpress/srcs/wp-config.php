<?php
/**
 * The base configuration for WordPress
 *
 * The wp-config.php creation script uses this file during the
 * installation. You don't have to use the web site, you can
 * copy this file to "wp-config.php" and fill in the values.
 *
 * This file contains the following configurations:
 *
 * * MySQL settings
 * * Secret keys
 * * Database table prefix
 * * ABSPATH
 *
 * @link https://wordpress.org/support/article/editing-wp-config-php/
 *
 * @package WordPress
 */

// ** MySQL settings - You can get this info from your web host ** //
/** The name of the database for WordPress */
define( 'DB_NAME', 'wordpress' );

/** MySQL database username */
define( 'DB_USER', 'wp_user' );

/** MySQL database password */
define( 'DB_PASSWORD', 'password_wp' );

/** MySQL hostname */
define( 'DB_HOST', 'localhost' );

/** Database Charset to use in creating database tables. */
define( 'DB_CHARSET', 'utf8mb4' );

/** The Database Collate type. Don't change this if in doubt. */
define( 'DB_COLLATE', '' );

/**#@+
 * Authentication Unique Keys and Salts.
 *
 * Change these to different unique phrases!
 * You can generate these using the {@link https://api.wordpress.org/secret-key/1.1/salt/ WordPress.org secret-key service}
 * You can change these at any point in time to invalidate all existing cookies. This will force all users to have to log in again.
 *
 * @since 2.6.0
 */
define( 'AUTH_KEY',         '.*Fn~lT^WdzLK<#5]rsP$M%MA==Sp10B%Y>8Muk-pV#2X!<k:]Hh(sV[|xiuWg9^' );
define( 'SECURE_AUTH_KEY',  '(6/Ud}jKiUBLH|jw`:[c-%nb7Y5!whT*bU-ufsU}D/Xnxb%@Dl`.J%@/bD<*>v?0' );
define( 'LOGGED_IN_KEY',    'B&b`Rz&g[1.IG]W{p[MgHIR~f@!87|r/qd&|Y;tc2k%eZVH_{Iuuw.9-LHh3M+!q' );
define( 'NONCE_KEY',        'C)~tuE!F9m14t3sKS,uNku( :@ m,n1~[FUu9WRXhaH)pp^jROmp:&qH?$jo{*Af' );
define( 'AUTH_SALT',        'd;Ku5.;)6I-_K<^zI47_`4~+>b|{/|M 6du8du/{8uOvoF;h8I7IDW*^lq&H,zV6' );
define( 'SECURE_AUTH_SALT', '9Mh4Jqq}M&%*Z%>`M+wWPA B<yP*$50IG#cqcq:f@NB bPz@(btqPLih/G{?1tgB' );
define( 'LOGGED_IN_SALT',   'k?MN(6,1N@Kpt{<,A1.@hImg<Ma>zx K*B4Sca)-Eu&AZ9<~H^Zi$x{Sw74gKV:Q' );
define( 'NONCE_SALT',       '}v}lX4{DwAMAK/MK0Q9(?C{Lhm2jBeC1l&42Cd_, w/[10e{_)C h.Jzvp<GIb#,' );

/**#@-*/

/**
 * WordPress Database Table prefix.
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

/* That's all, stop editing! Happy publishing. */

/** Absolute path to the WordPress directory. */
if ( ! defined( 'ABSPATH' ) ) {
	define( 'ABSPATH', __DIR__ . '/' );
}

/** Sets up WordPress vars and included files. */
require_once ABSPATH . 'wp-settings.php';
