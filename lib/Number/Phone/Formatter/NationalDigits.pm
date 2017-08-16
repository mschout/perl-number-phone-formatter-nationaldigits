# COPYRIGHT

package Number::Phone::Formatter::NationalDigits;

# ABSTRACT: A L<Number::Phone> formatter for the national digits only.

use strict;
use warnings;

=method format($number)

This is the only method.  It takes an
L<E.123|http://www.itu.int/rec/T-REC-E.123> international format string as its
only argument and reformats it as the national portion of the number with all
non-digits removed.  For example:

 +44 20 8771 2924 -> 2087712924
 +1 212 334 0611  -> 2123340611

=cut

sub format {
    my ($self, $number) = @_;

    $number =~ s/^.*?\s//;
    $number =~ s/[^0-9]+//g;

    return $number;
}

1;

__END__

=head1 SYNOPSIS

 # option 1: use with Number::Phone
 #
 # prints 2087712924
 my $number = Number::Phone->new('+44 20 8771 2924');
 print $number->format_using('NationalDigits');

 # Option 2: use standaline, without Number::Phone
 #
 # prints: 2087712924
 #
 print Number::Phone::Formatter::NationalDigits->format('+44 20 8771 2924');

=head1 DESCRIPTION

This is a formatter that will format an
L<E.123|http://www.itu.int/rec/T-REC-E.123> formatted number (e.g. from
L<Number::Phone>) as the National portion of the number, with all non-digits
removed.  This is the same thing that L<Number::Phone::Formatter::Raw> does,
except you can install this module without installing the entire
L<Number::Phone> package, which is quite large.  If you merely need to format 
L<E.123|http://www.itu.int/rec/T-REC-E.123> phone numbers as raw national
digits, and you don't want to install the entirety of L<Number::Phone>, then
this is the module for you.  Otherwise you should probably just stick with
L<Number::Phone::Formatter::Raw>.

This module can be used with L<Number::Phone>, or, as a standalone module.
