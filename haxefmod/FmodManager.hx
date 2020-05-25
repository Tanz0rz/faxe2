package haxefmod;

import haxefmod.FmodEvents.FmodEventListener;
import haxefmod.FmodManagerPrivate;

@:access(haxefmod.FmodManagerPrivate)
class FmodManager {
    //// System

    /**
        Enables console debug messages for the system-specific calls made to FMOD
    **/
    public static function EnableDebugMessages() {
        FmodManagerPrivate.GetInstance().EnableDebugMessages();
    }

    /**
        Explicitly starts the FMOD audio engine (only required on html5)
    **/
    public static function Initialize() {
        FmodManagerPrivate.GetInstance();
    }


    /**
        Returns true if the FMOD audio engine is initialized
    **/
    public static function IsInitialized():Bool {
        return FmodManagerPrivate.GetInstance().IsInitialized();
    }

    /**
        A call required by the FMOD API at all times. This should be in the main update loop of the game
    **/
    public static function Update() {
        FmodManagerPrivate.GetInstance().Update();
    }

    //// Music

    /**
        Plays a song from the sound bank
        @param songPath bank path of the song event in the sound bank
    **/
    public static function PlaySong(songPath:String) {
        FmodManagerPrivate.GetInstance().PlaySong(songPath);
    }

    /**
        Used to transition between two songs

        Sends the "stop" command to the FMOD API and waits for the
        current song to stop before playing a new song from the sound bank
        @param songPath bank path of the song event in the sound bank
        @see https://tanneris.me/FMOD-AHDSR
    **/
    public static function PlaySongTransition(songPath:String) {
        FmodManagerPrivate.GetInstance().PlaySongTransition(songPath);
    }

    /**
        Gets an event parameter value from the song
        @param parameterName name of parameter on song
    **/
    public static function GetEventParameterOnSong(parameterName:String) {
        return FmodManagerPrivate.GetInstance().GetEventParameterOnSong(parameterName);
    }

    /**
        Sets an event parameter value on the song

        Setting a parameter when the game is paused will require a manual call to Update() for FMOD to see the change
        @param parameterName name of parameter on song
        @param parameterValue value for parameter
    **/
    public static function SetEventParameterOnSong(parameterName:String, parameterValue:Float) {
        FmodManagerPrivate.GetInstance().SetEventParameterOnSong(parameterName, parameterValue);
    }

    /**
        Sends the "stop" command to the FMOD API for the current song
    **/
    public static function StopSong() {
        FmodManagerPrivate.GetInstance().StopSong();
    }

    /**
        If a song is playing, it will stop immediately
    **/
    public static function StopSongImmediately() {
        FmodManagerPrivate.GetInstance().StopSongImmediately();
    }

    /**
        If a song is playing, it will pause
    **/
    public static function PauseSong() {
        FmodManagerPrivate.GetInstance().PauseSong();
    }

    /**
        If a song is paused, it will unpause
    **/
    public static function UnpauseSong() {
        FmodManagerPrivate.GetInstance().UnpauseSong();
    }

    //// Sound effects

    /**
        Plays a sound in a fire-and-forget fashion

        There is no way to interact with these sounds once they are started

        Follows the Master Track rules which are set in FMOD Studio (Max Instances, Stealing, and probably more)

        @param soundPath bank path of the sound event in the sound bank
        @see https://tanneris.me/FMOD-Macro-Controls
    **/
    public static function PlaySoundOneShot(soundPath:String) {
        FmodManagerPrivate.GetInstance().PlaySoundOneShot(soundPath);
    }

    /**
        Plays a sound and returns the Id to allow further interactions

        When this sound is no longer needed, call ReleaseSound to cleanup memory

        Simple sound effects should be played with PlaySoundOneShot
        @param soundPath bank path of the sound event in the sound bank
        @return soundId of the new event instance
    **/
    public static function PlaySoundWithReference(soundPath:String):String {
        return FmodManagerPrivate.GetInstance().PlaySoundWithReference(soundPath);
    }

    /**
        Gets an event parameter value from a sound
        @param soundId Id of a currently-loaded sound
        @param parameterName name of parameter on sound
    **/
    public static function GetEventParameterOnSound(soundId:String, parameterName:String):Float {
        return FmodManagerPrivate.GetInstance().GetEventParameterOnSound(soundId, parameterName);
    }

    /**
        Sets an event parameter value on a sound

        Setting a parameter when the game is paused will require a manual call to Update() for FMOD to see the change
        @param soundId Id of a currently-loaded sound
        @param parameterName name of parameter on sound
        @param parameterValue value for parameter
    **/
    public static function SetEventParameterOnSound(soundId:String, parameterName:String, parameterValue:Float) {
        FmodManagerPrivate.GetInstance().SetEventParameterOnSound(soundId, parameterName, parameterValue);
    }

    /**
        Stops a sound for the provided sound Id

        To stop a sound immediately, use StopSoundImmediately(soundId)
        @param soundId Id of a currently-loaded sound
    **/
    public static function StopSound(soundId:String) {
        FmodManagerPrivate.GetInstance().StopSound(soundId);
    }

    /**
        Immediately stops a sound for the provided sound Id
        @param soundId Id of a currently-loaded sound
    **/
    public static function StopSoundImmediately(soundId:String) {
        FmodManagerPrivate.GetInstance().StopSoundImmediately(soundId);
    }

    /**
        Immediately stops a sound for the provided sound Id and releases it from memory
        @param soundId Id of a currently-loaded sound
    **/
    public static function ReleaseSound(soundId:String) {
        FmodManagerPrivate.GetInstance().ReleaseSound(soundId);
    }

    //// Utility

    /**
        Experimental: register any class that satisfies the FmodEventLister interface

        Will be used to allow utility methods (like screen transition helpers) for any Haxe framework
        @param eventListener An implementer of the FmodEventListener interface
    **/
    public static function RegisterEventListener(eventListener:FmodEventListener) {
        FmodManagerPrivate.GetInstance().RegisterEventListener(eventListener);
    }
}