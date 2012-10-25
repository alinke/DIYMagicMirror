package sk.prasa.examples.albumbasic.controller 
{
	import org.puremvc.as3.patterns.command.MacroCommand;			
	
	/**
	 * @author Michal Gron (michal.gron@gmail.com)
	 * 
	 */
	public class StartupCommand extends MacroCommand 
	{	
		override protected function initializeMacroCommand() : void
		{
			addSubCommand(ModelPrepCommand);
			addSubCommand(ViewPrepCommand);
		}
	}
}
