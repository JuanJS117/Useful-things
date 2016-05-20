use warnings;
use strict;

unless ($ARGV[0] && $ARGV[1] && $ARGV[2]){
  &usage;
}

sub usage {
  print "\nTo use this program, type in the command line:\n";
  print "\tperl DataNames2csv.pl file.data file.names file.csv\n";
  print "\n\nThis program takes a .data file and a .names file, and\ncreates a .csv file suitable for Weka using\n\n";

}

my ($data_file, $names_file, $csv_file) = @ARGV;

open (DATAINP, $data_file) or die "\nCould not open $data_file\n";
my @data = <DATAINP>;
close DATAINP;

open (NAMESINP, $names_file) or die "\nCould not read names from $names_file\n";
my @names = <NAMESINP>;
close NAMESINP;

my $header = "";
foreach my $line (@names){
  if ($line =~m/^\s{2,3}\d+\.\s(\w+)/){
    if ($header !~ ""){
      $header = $header.$1.",";
    }
  }
}
chop $header;
$header = $header."\n";

open (my $OUT, '>', $csv_file) or die "\nCould not write to $csv_file\n";
print $OUT $header;
foreach my $outline (@data){
  print $OUT $outline;
}
close $OUT;
