require 'tempfile'

class RingtoneCropWorker
  include Sidekiq::Worker

  def perform(id)
    ringtone = Ringtone.find(id)
    source = ringtone.source
    outfile = Paperclip::Tempfile.new(['ringtone', '.mp3'])
    Paperclip.run("ffmpeg", "-i #{source.path} -ss #{source.start_time} -y -to #{source.end_time} -t 30 -acodec copy #{outfile.path}" )
    #CANONICAL VERSION: Paperclip.run("ffmpeg", "-i #{source.path} -y -t 30 -acodec copy #{outfile.path}" )
    ringtone.ringtone = outfile
    ringtone.processing = false
    ringtone.save
    outfile.close
  end
end
