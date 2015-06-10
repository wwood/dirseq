require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

describe 'script' do
  path_to_script = File.join(File.dirname(__FILE__),'..','bin','dirseq')
  data_dir = File.absolute_path(File.join(File.dirname(__FILE__),'data'))

  it "should regular mode" do
    answer = %w(
    contig	type	start	end	strand	forward_average_coverage	reverse_average_coverage	annotation
    ).join("\t")+"\n"+%w(
    contig_100	CDS	2	127	+	0.0	1.1428571428571428	unannotated
    ).join("\t")+"\n"

    found = Bio::Commandeer.run "#{path_to_script} --bam #{data_dir}/eg.bam --gff #{data_dir}/eg.gff -q"

    found.should == answer
  end

  it "should ignore directions mode" do
    found = Bio::Commandeer.run "#{path_to_script} --bam #{data_dir}/eg.bam --gff #{data_dir}/eg.gff -q --ignore-direction"

    answer = %w(
    contig	type	start	end	strand	average_coverage	annotation
    ).join("\t")+"\n"+%w(
    contig_100	CDS	2	127	+	1.1428571428571428	unannotated
    ).join("\t")+"\n"

    found.should == answer
  end

  it 'should not fail when the GFF has a FASTA section' do
    answer = %w(
    contig	type	start	end	strand	forward_average_coverage	reverse_average_coverage	annotation
    ).join("\t")+"\n"+%w(
    contig_100	CDS	2	127	+	0.0	1.1428571428571428	unannotated
    ).join("\t")+"\n"

    found = Bio::Commandeer.run "#{path_to_script} --bam #{data_dir}/eg.bam --gff #{data_dir}/eg_with_fasta.gff -q"

    found.should == answer
  end

  it 'should print annotation out properly' do
    answer = %w(
    contig	type	start	end	strand	forward_average_coverage	reverse_average_coverage	annotation
    ).join("\t")+"\n"+%w(
    contig_100	CDS	2	127	+	0.0	1.1428571428571428	putative
    ).join("\t")+" methyltransferase YcgJ\n"

    found = Bio::Commandeer.run "#{path_to_script} --bam #{data_dir}/eg.bam --gff #{data_dir}/realer.gff -q"

    found.should == answer
  end
end
