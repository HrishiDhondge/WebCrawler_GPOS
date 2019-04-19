#!c:\\perl\\bin
use strict;
use warnings;
use WWW::Mechanize;
open(MAINOUT,">>","Mainoutput.csv");
open(INPUT, "<","testdata.fasta");
my @all_data = <INPUT>;
my $joined_d = join("",@all_data);
close INPUT;
@all_data = split(">",$joined_d);
my $len = @all_data;

for(my $i=1;$i<$len;$i++)
{
	my $alone = $all_data[$i];
	my @single = split ("\n",$alone);
	my $length = @single;
	
	my $accesion = substr($single[0],3,6);
	my $sequence = "";
	my $fc = substr($accesion,0,1);
	if($fc eq "A" ||$fc eq "O"||$fc eq "P"||$fc eq "Q")
	{
		$sequence = ">". $accesion."\n";
	}
	else
	{
		$sequence = ">". "??????"."\n";
	}

	for(my $j=1;$j<$length;$j++)
	{
		$sequence = $sequence . $single[$j]."\n";
	}

	my $filetext = "output.txt";
	open(OUTTXT,">",$filetext);

my $site = WWW::Mechanize->new;

my $seq = $sequence;
chomp($seq);
my $url = 'http://www.csbio.sjtu.edu.cn/bioinf/Gpos/';
$site->get($url);
$site->submit_form(
  form_name => 'form1',
  fields => {
    'S1' => $seq,
  },
);

print OUTTXT $site->content;
close OUTTXT;

open(IN1, "<",$filetext);
my @alls = <IN1>;
my $singl = join("",@alls);
my $loc = index($singl,"<font size=4pt color='\#5712A3' face='times new roman'>");

my $main = substr($singl,$loc);
$loc = index($main,">");
$main = substr($main,$loc+1);

$loc = index($main,"<");
$main = substr($main,0,$loc);
print "$accesion\t$main\n";
print MAINOUT "$accesion,$main\n";
close IN1;
}
my $delete = "del output.txt";
system($delete);
close(MAINOUT);
