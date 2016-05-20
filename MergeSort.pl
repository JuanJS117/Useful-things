##-------------------------------------------------------------------------------
##  Merge sort
##
##  Code written by Juan Jimenez Sanchez
##
##

use strict;
use warnings;

##-------------------------------------------------------------------------------

unless ($ARGV[0]){
  &usage();
  exit;
}

##-------------------------------------------------------------------------------

my @list = &getListFromFile($ARGV[0]);
@list = &spliceLinesInElements(@list);
@list = &trimLeftZeros(@list);
my @sorted_list = &merge_sort(@list);



foreach my $element (@sorted_list){
  print "$element\n";
}

##-------------------------------------------------------------------------------

sub usage {
  print "\nTo call this program, type in the command line:\n";
  print "\tperl MergeSort.pl list.txt\n";
}

sub getListFromFile {
  my ($file) = @_;
  open (LIST, $file) or die "Could not open $file to extract list!!\n";
  my @list = <LIST>;
  return @list;
}

sub spliceLinesInElements {
  my (@list) = @_;
  my @elements; # We have to ensure that every element of the list is a single element, not a group of elements
  for (my $i = 0; $i < scalar(@list); $i++){ # For every line in our list:
    $list[$i] =~s/\n//; # We trim newlines
    if ($list[$i] =~m/\s+/){ # If we find any other blank space symbol, that means we have two elements separated in the same line
      @elements = split(/\s/,$list[$i]); # So we split that line
      splice (@list, $i, 1, @elements); # And we replace the line into our list, by the array of elements obtained from it
    }
  }
  return @list;
}

sub trimLeftZeros {
  my (@list) = @_;
  foreach my $element (@list){
    $element =~s/^0+//;
  }
  return @list;
}

sub merge_sort {
    my @list = @_;
    return @list if @list < 2;
    my $middle = int @list / 2;
    my @a = merge_sort(@list[0 .. $middle - 1]);
    my @b = merge_sort(@list[$middle .. $#list]);
    for (@list) {
        $_ = !@a            ? shift @b
           : !@b            ? shift @a
           : $a[0] <= $b[0] ? shift @a
           :                  shift @b;
    }
    return @list;
}
