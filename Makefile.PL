
use strict;
use warnings;



use ExtUtils::MakeMaker 6.30;



my %WriteMakefileArgs = (
  "ABSTRACT" => "Finds sentence boundaries, and returns their offsets.",
  "AUTHOR" => "Andre Santos <andrefs\@cpan.org>",
  "BUILD_REQUIRES" => {
    "English" => 0,
    "Lingua::EN::Sentence" => 0,
    "Test::More" => 0
  },
  "CONFIGURE_REQUIRES" => {
    "ExtUtils::MakeMaker" => "6.30"
  },
  "DISTNAME" => "Lingua-EN-Sentences-Offsets",
  "EXE_FILES" => [
    "bin/split_sentences"
  ],
  "LICENSE" => "perl",
  "NAME" => "Lingua::EN::Sentences::Offsets",
  "PREREQ_PM" => {
    "Carp" => 0,
    "Data::Dump" => 0,
    "Exporter" => 0,
    "base" => 0,
    "feature" => 0,
    "strict" => 0,
    "utf8::all" => 0,
    "warnings" => 0
  },
  "VERSION" => "0.01_05",
  "test" => {
    "TESTS" => "t/*.t"
  }
);


unless ( eval { ExtUtils::MakeMaker->VERSION(6.56) } ) {
  my $br = delete $WriteMakefileArgs{BUILD_REQUIRES};
  my $pp = $WriteMakefileArgs{PREREQ_PM};
  for my $mod ( keys %$br ) {
    if ( exists $pp->{$mod} ) {
      $pp->{$mod} = $br->{$mod} if $br->{$mod} > $pp->{$mod};
    }
    else {
      $pp->{$mod} = $br->{$mod};
    }
  }
}

delete $WriteMakefileArgs{CONFIGURE_REQUIRES}
  unless eval { ExtUtils::MakeMaker->VERSION(6.52) };

WriteMakefile(%WriteMakefileArgs);



