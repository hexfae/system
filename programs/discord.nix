{
  inputs,
  lib,
  config,
  ...
}: {
  options.huncs.programs.discord.enable = lib.mkEnableOption "discord";

  config = lib.mkIf config.huncs.programs.discord.enable {
    home-manager.users.hexfae = {
      imports = [inputs.nixcord.homeModules.nixcord];
      programs.nixcord = {
        enable = true;
        discord = {
          autoscroll.enable = true;
          branch = "canary";
        };
        config = {
          plugins = {
            accountPanelServerProfile.enable = true;
            alwaysAnimate.enable = true;
            alwaysExpandRoles.enable = true;
            alwaysTrust.enable = true;
            anonymiseFileNames.enable = true;
            betterFolders.enable = true;
            betterGifAltText.enable = true;
            betterGifPicker.enable = true;
            betterRoleContext.enable = true;
            betterRoleDot.enable = true;
            betterSessions.enable = true;
            betterSettings.enable = true;
            betterUploadButton.enable = true;
            biggerStreamPreview.enable = true;
            callTimer.enable = true;
            clearUrLs.enable = true;
            consoleJanitor.enable = true;
            copyEmojiMarkdown.enable = true;
            copyFileContents.enable = true;
            copyStickerLinks.enable = true;
            copyUserUrLs.enable = true;
            customIdle.enable = true;
            customRpc.enable = true;
            dearrow.enable = true;
            decor.enable = true;
            disableCallIdle.enable = true;
            experiments.enable = true;
            expressionCloner.enable = true;
            fakeNitro.enable = true;
            fakeProfileThemes.enable = true;
            favoriteEmojiFirst.enable = true;
            favoriteGifSearch.enable = true;
            fixCodeblockGap.enable = true;
            fixImagesQuality.enable = true;
            fixSpotifyEmbeds.enable = true;
            fixYoutubeEmbeds.enable = true;
            forceOwnerCrown.enable = true;
            friendInvites.enable = true;
            friendsSince.enable = true;
            fullSearchContext.enable = true;
            fullUserInChatbox.enable = true;
            gifPaste.enable = true;
            greetStickerPicker.enable = true;
            iLoveSpam.enable = true;
            imageFilename.enable = true;
            imageLink.enable = true;
            implicitRelationships.enable = true;
            keepCurrentChannel.enable = true;
            loadingQuotes.enable = true;
            memberCount.enable = true;
            mentionAvatars.enable = true;
            messageClickActions.enable = true;
            messageLinkEmbeds.enable = true;
            messageLogger.enable = true;
            mutualGroupDMs.enable = true;
            noDevtoolsWarning.enable = true;
            noF1.enable = true;
            noOnboardingDelay.enable = true;
            normalizeMessageLinks.enable = true;
            noUnblockToJump.enable = true;
            oneko.enable = true;
            openInApp.enable = true;
            pauseInvitesForever.enable = true;
            permissionFreeWill.enable = true;
            permissionsViewer.enable = true;
            petpet.enable = true;
            pictureInPicture.enable = true;
            pinDMs.enable = true;
            platformIndicators.enable = true;
            previewMessage.enable = true;
            quickMention.enable = true;
            quickReply.enable = true;
            reactErrorDecoder.enable = true;
            readAllNotificationsButton.enable = true;
            relationshipNotifier.enable = true;
            replaceGoogleSearch.enable = true;
            replyTimestamp.enable = true;
            revealAllSpoilers.enable = true;
            reverseImageSearch.enable = true;
            reviewDb.enable = true;
            roleColorEverywhere.enable = true;
            sendTimestamps.enable = true;
            serverInfo.enable = true;
            serverListIndicators.enable = true;
            shikiCodeblocks.enable = true;
            showAllMessageButtons.enable = true;
            showConnections.enable = true;
            showHiddenChannels.enable = true;
            showHiddenThings.enable = true;
            showMeYourName.enable = true;
            showTimeoutDuration.enable = true;
            silentTyping.enable = true;
            sortFriendRequests.enable = true;
            spotifyCrack.enable = true;
            startupTimings.enable = true;
            stickerPaste.enable = true;
            summaries.enable = true;
            themeAttributes.enable = true;
            translate.enable = true;
            typingIndicator.enable = true;
            typingTweaks.enable = true;
            unindent.enable = true;
            unlockedAvatarZoom.enable = true;
            unsuppressEmbeds.enable = true;
            userMessagesPronouns.enable = true;
            userVoiceShow.enable = true;
            usrbg.enable = true;
            validReply.enable = true;
            validUser.enable = true;
            vencordToolbox.enable = true;
            viewIcons.enable = true;
            viewRaw.enable = true;
            voiceChatDoubleClick.enable = true;
            voiceDownload.enable = true;
            voiceMessages.enable = true;
            volumeBooster.enable = true;
            whoReacted.enable = true;
            youtubeAdblock.enable = true;
          };
        };
      };
    };
  };
}
