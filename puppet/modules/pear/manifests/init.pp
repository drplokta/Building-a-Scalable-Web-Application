class pear {
    package { phpunit:
        ensure   => latest,
        provider => pear,
    }
}