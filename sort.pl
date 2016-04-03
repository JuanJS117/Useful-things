## Sorting Algorithm

## Made by Juan

use strict;
use warnings;

unless ($ARGV[0] =~m/N/ or $ARGV[0] =~m/A/){
  &flags_usage;
  exit;
}

unless ($ARGV[1]){
  &usage;
  exit;
}

my ($type_of_sorting, $input_filename, $output_filename) = @ARGV;

my @elements_to_sort;
my @elements_to_sort_in_line;
open (INPUT, $input_filename) or die "Could not open $input_filename!!\n";
foreach my $line (<INPUT>){
  $line =~s/\s/ /g;
  @elements_to_sort_in_line = split (" ", $line);
  foreach my $element (@elements_to_sort_in_line){
    push (@elements_to_sort, $element);
  }
}





sub usage {
  print "\nTo sort any list of things, you have to supply two things:\n";
  print "\t- The file name containing the list of elements to be sorted.\n";
  print "\t- The kind of elements to be sorted (numerical -N or alphabetical -A).\n";
  print "You could also supply an output file name, in which the sorted list will be stored.\n\n";
}

sub flags_usage {
  print "\nYou typed a wrong flag. Flags admitted:\n";
  print "\t-N --> Sort numerically\n";
  print "\t-A --> Sort alphabetically\n";
}
