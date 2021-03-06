require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

describe 'script' do
  path_to_script = File.join(File.dirname(__FILE__),'..','bin','dirseq')
  data_dir = File.absolute_path(File.join(File.dirname(__FILE__),'data'))

  it "should regular mode" do
    answer = %w(
    contig	type	start	end	strand	forward_average_coverage	reverse_average_coverage	annotation	ID
    ).join("\t")+"\n"+%w(
    contig_100	CDS	2	127	+	0.0	1.1428571428571428	unannotated	40_1
    ).join("\t")+"\n"

    found = Bio::Commandeer.run "#{path_to_script} --bam #{data_dir}/eg.bam --gff #{data_dir}/eg.gff -q"

    found.should == answer
  end

  it "should ignore directions mode" do
    found = Bio::Commandeer.run "#{path_to_script} --bam #{data_dir}/eg.bam --gff #{data_dir}/eg.gff -q --ignore-direction"

    answer = %w(
    contig	type	start	end	strand	average_coverage	annotation	ID
    ).join("\t")+"\n"+%w(
    contig_100	CDS	2	127	+	1.1428571428571428	unannotated	40_1
    ).join("\t")+"\n"

    found.should == answer
  end

  it 'should not fail when the GFF has a FASTA section' do
    answer = %w(
    contig	type	start	end	strand	forward_average_coverage	reverse_average_coverage	annotation	ID
    ).join("\t")+"\n"+%w(
    contig_100	CDS	2	127	+	0.0	1.1428571428571428	unannotated	40_1
    ).join("\t")+"\n"

    found = Bio::Commandeer.run "#{path_to_script} --bam #{data_dir}/eg.bam --gff #{data_dir}/eg_with_fasta.gff -q"

    found.should == answer
  end

  it 'should print annotation out properly' do
    answer = %w(
    contig	type	start	end	strand	forward_average_coverage	reverse_average_coverage	annotation	ID
    ).join("\t")+"\n"+%w(
    contig_100	CDS	2	127	+	0.0	1.1428571428571428	putative
    ).join("\t")+" methyltransferase YcgJ	PROKKA_00001\n"

    found = Bio::Commandeer.run "#{path_to_script} --bam #{data_dir}/eg.bam --gff #{data_dir}/realer.gff -q"

    found.should == answer
  end

  it 'should print counts correctly' do
    answer = %w(
    contig	type	start	end	strand	forward_read_count	reverse_read_count	annotation	ID
    ).join("\t")+"\n"+%w(
    contig_100	CDS	2	127	+	0.0	2.0	putative
    ).join("\t")+" methyltransferase YcgJ	PROKKA_00001\n"

    found = Bio::Commandeer.run "#{path_to_script} --bam #{data_dir}/eg.bam --gff #{data_dir}/realer.gff -q --measure-type count"

    found.should == answer
  end

  it 'should count only the forward read when asked' do
    answer = %w(
    contig	type	start	end	strand	forward_read_count	reverse_read_count	annotation	ID
    ).join("\t")+"\n"+%w(
    contig_100	CDS	2	127	+	0.0	1.0	putative
    ).join("\t")+" methyltransferase YcgJ	PROKKA_00001\n"

    found = Bio::Commandeer.run "#{path_to_script} --bam #{data_dir}/eg.bam --gff #{data_dir}/realer.gff -q --measure-type count --forward-read-only"

    found.should == answer
  end
end
