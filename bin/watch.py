#!/usr/bin/python
import sys
import os
import subprocess
import pyinotify

class EventHandler( pyinotify.ProcessEvent ):

	def __init__( self, extensions, cmd ):
		self.extensions = extensions
		self.cmd = cmd

	def _check( self, event ):
		if all( not event.pathname.endswith( ext ) for ext in self.extensions ):
			return False

		return True

	def _cmd( self ):
		print( ">> Executing `%s`" % self.cmd )
		subprocess.call( self.cmd.split( ' ' ))
		print()

	def process_IN_CREATE( self, event ):
		if self._check( event ): self._cmd()

	def process_IN_CREATE( self, event ):
		if self._check( event ): self._cmd()

	def process_IN_MODIFY( self, event ):
		if self._check( event ): self._cmd()

if __name__ == '__main__':
	assert len( sys.argv ) >= 4, "Invalid number of arguments, expected <path> <extensions> <cmd>"
	path = sys.argv[1]
	extensions = sys.argv[2]
	cmd = sys.argv[3]

	wm = pyinotify.WatchManager()
	mask = pyinotify.IN_DELETE | pyinotify.IN_CREATE | pyinotify.IN_MODIFY

	handler = EventHandler( extensions=extensions.split( ',' ), cmd=cmd )
	notifier = pyinotify.Notifier( wm, default_proc_fun=handler )

	wm.add_watch( path, mask, rec=True, auto_add=True )

	print( ">> Started monitoring for creation/deletion/modification..." )
	notifier.loop()
